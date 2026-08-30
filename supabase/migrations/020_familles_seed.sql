-- ============================================================================
-- 020_familles_seed.sql
-- Familles d'articles par défaut, alignées sur les catégories réelles de
-- l'atelier (Salon, Chambre, Bureau...) — utilisées comme filtre catégorie
-- dans le catalogue produits. Ré-exécutable.
-- ============================================================================

insert into famille_article (code, libelle) values
  ('SALON', 'Salon'),
  ('CHAMBRE', 'Chambre'),
  ('BUREAU', 'Bureau'),
  ('CUISINE', 'Cuisine'),
  ('SALLE_A_MANGER', 'Salle à manger'),
  ('RANGEMENT', 'Rangement'),
  ('ACCESSOIRE', 'Accessoire'),
  ('AUTRE', 'Autre')
on conflict (code) do nothing;
