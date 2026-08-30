-- ============================================================================
-- 016_validation_inventaire.sql
-- Comble un manque : la validation d'un inventaire ne générait encore aucun
-- mouvement de stock, donc un comptage physique n'avait jamais d'effet réel
-- sur le stock. Ajoute le trigger de validation, symétrique à
-- app.valider_bl / app.valider_reception (migration 011).
--
-- Les écarts sont valorisés au CMP courant de l'article (jamais au prix
-- d'achat standard) pour ne pas fausser le CMP par un ajustement d'inventaire
-- (règle CMP section 4 : recalculé à chaque entrée réelle, pas à une
-- correction de comptage).
-- Ré-exécutable.
-- ============================================================================

create or replace function app.valider_inventaire() returns trigger
language plpgsql as $$
declare
  r record;
  v_cmp numeric;
  v_ecart numeric;
begin
  for r in
    select article_id, variante_id, ecart
      from inventaire_ligne
     where inventaire_id = new.id
       and quantite_comptee is not null
  loop
    v_ecart := r.ecart;
    if v_ecart = 0 then
      continue;
    end if;

    select cmp into v_cmp from stock
     where article_id = r.article_id and depot_id = new.depot_id
       and variante_id is not distinct from r.variante_id;
    v_cmp := coalesce(v_cmp, 0);

    if v_ecart > 0 then
      insert into mouvement_stock (
        article_id, variante_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
        document_type, document_id, cree_par
      ) values (
        r.article_id, r.variante_id, new.depot_id, 'INVENTAIRE_AJUST', 'ENTREE', v_ecart, v_cmp,
        'INVENTAIRE', new.id, new.cree_par
      );
    else
      insert into mouvement_stock (
        article_id, variante_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
        document_type, document_id, cree_par
      ) values (
        r.article_id, r.variante_id, new.depot_id, 'INVENTAIRE_AJUST', 'SORTIE', abs(v_ecart), v_cmp,
        'INVENTAIRE', new.id, new.cree_par
      );
    end if;
  end loop;

  return new;
end;
$$;

drop trigger if exists trg_valider_inventaire on inventaire;
create trigger trg_valider_inventaire
  after update on inventaire
  for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.valider_inventaire();
