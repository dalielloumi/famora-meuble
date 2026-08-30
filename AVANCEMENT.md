# Avancement — Gestion Commerciale Meuble

## État global : toutes les étapes de PROJET.md sont construites

Les 17 étapes de la section 7 de PROJET.md sont couvertes. `flutter analyze`,
`flutter test`, `flutter build web` et `flutter build apk --debug` passent
tous sans erreur. Reste : tests fonctionnels par l'utilisateur, données réelles
(société, catalogue, tiers), build de production signé (étape 17 finale).

## Étape 1 — Projet Flutter, dépendances, thème, client Supabase — FAIT

- `flutter create` (web + android), Flutter mis à jour vers 3.44.9 / Dart 3.12.2.
- Dépendances : `supabase_flutter`, `flutter_riverpod`, `go_router`, `freezed`,
  `json_serializable`, `flutter_form_builder`, `form_builder_validators`,
  `pluto_grid`, `pdf`, `printing`, `intl`, `decimal`, `google_fonts`,
  `flutter_localizations`.
- Thème unique (`lib/core/theme`) : palette section 5, `AppText.montant` avec
  chiffres tabulaires, densité compacte.
- Client Supabase configuré via `--dart-define-from-file=env.json` (gitignored).
- Toolchain Android réparé (Gradle 9.1.0, AGP 9.0.1, Kotlin 2.3.20).

## Projet Supabase connecté

- Projet : `meuble` (réf. `fjlglmovxgmrcemxuedk`), org `dalielloumi`.
- 16 migrations (`supabase/migrations/001` à `016`) poussées via
  `npx supabase db push --linked` et confirmées appliquées.
- `env.json` local contient l'URL du projet et la clé publishable (anon).

## Étapes 2 à 6 — Schéma, fonctions métier, triggers, RLS, seed — FAIT

- `001` à `009` : schéma complet (référentiel, catalogue, tiers, achats,
  ventes, fabrication, stock, règlements, livraison/SAV).
- `010_fonctions_metier.sql` : `next_numero()`, calcul des lignes/totaux
  (HT → TVA par taux → timbre → retenue à la source → TTC), CMP.
- `011_triggers.sql` : calcul des lignes, immuabilité des documents validés,
  génération des mouvements de stock (BL/réception), cycle de vie de l'OF,
  lettrage des règlements, effets impayés, solde tiers, caisse.
- `012_rls_policies.sql` : GRANT PostgREST + garde-fou RLS.
- `013_seed.sql` : rôle ADMIN, société, exercice, dépôts, unités, taux de TVA.
- `014_corrections.sql` : correctif de sécurité découvert en cours de route —
  la révocation du schéma `app` cassait les appels internes entre triggers ;
  remplacée par des GRANT ciblés + wrapper public pour le provisioning.
- `015_corrections_numerotation.sql` : correctif de règle métier — `numero`
  était `NOT NULL` dès la création d'un brouillon, ce qui aurait consommé un
  numéro à chaque brouillon abandonné (violation de « numérotation continue
  sans trou »). `numero` est maintenant assigné uniquement à la validation
  (trigger `app.assigner_numero_validation` / `..._creation`).
- `016_validation_inventaire.sql` : la validation d'un inventaire ne générait
  encore aucun mouvement de stock ; ajouté `app.valider_inventaire()`,
  symétrique à `valider_bl`/`valider_reception`.

## Étapes 7-9 — Modèles, repositories, auth, navigation, widgets partagés — FAIT

- Modèles freezed (immuables) pour chaque table métier ; conversion
  `Decimal` systématique via `DecimalConverter` (jamais de `double`).
- Repositories = seul point de contact avec Supabase (`lib/repositories/`).
- Auth Supabase (connexion/déconnexion), provisioning du premier profil
  (RPC `provisionner_utilisateur_admin`, jamais de mot de passe géré côté SQL).
- `AdaptiveScaffold` (NavigationRail desktop / BottomNavigationBar mobile),
  routing `go_router` avec redirection selon l'état d'authentification.
- Widgets partagés : `AppDataGrid` (wrapper PlutoGrid avec recherche
  intégrée), `StatutBar`, `MontantCell`, `TiersSelect`, `ArticleSelect`,
  `LignesDocumentEditeur`.

## Étape 10 — Paramétrage — FAIT

Articles (prix de vente en avant, prix d'achat optionnel/secondaire — décision
utilisateur : l'app sert à émettre des documents, pas à suivre la marge),
tiers (clients/fournisseurs), dépôts. CRUD complet avec `AppDataGrid`.

## Étape 11 — Cycle vente — FAIT

Devis → Commande client → BL → Facture → Avoir, chaînés (chaque étape propose
« Créer la suivante » en copiant les lignes). PDF (devis, facture) via
`core/pdf/document_pdf.dart` + `printing`. Validation, annulation, immuabilité
appliquées côté serveur (le client ne fait qu'appeler `UPDATE statut`).

## Étape 12 — Cycle achat — FAIT

Commande fournisseur → Réception → Facture d'achat → Avoir, même logique de
chaînage que les ventes.

## Étape 13 — Stock — FAIT

Consultation (quantité + CMP + valeur par article/dépôt), historique des
mouvements, transferts entre dépôts, inventaires (comptage → écarts →
validation génère les mouvements `INVENTAIRE_AJUST`, valorisés au CMP courant
pour ne pas fausser le CMP).

## Étape 14 — Atelier — FAIT

Nomenclatures (produit fini + composants + quantités), ordres de fabrication
(brouillon → lancé [consomme les composants, calcule `cout_matiere`] → clôturé
[produit le fini au coût unitaire réel] ou annulé).

## Étape 15 — Finance — FAIT

Règlements (encaissement/décaissement) avec lettrage sur les factures dues
(un règlement peut solder plusieurs factures), effets (chèques/traites) avec
marquage encaissé/impayé, caisses avec opérations manuelles.

## Étape 16 — Livraison, SAV, tableau de bord — FAIT

Tournées de livraison (ajout de BL validés, statut livrée/échec par ligne) et
dossiers SAV (ouverture, interventions avec coût cumulé, statut), tous deux
en onglets sous Ventes (structure des dossiers de PROJET.md section 6).
Tableau de bord avec indicateurs réels (CA du mois, impayés, devis en
attente, commandes en cours, OF en cours, alertes stock).

## Étape 17 — Build final — PARTIEL

`flutter build web` et `flutter build apk --debug` passent. Reste : APK
**signé** (keystore de production) + choix d'hébergement web (Vercel/Netlify/
Cloudflare Pages) + sauvegarde automatique de la base — actions qui
nécessitent des décisions/accès qu'only l'utilisateur peut fournir (compte
d'hébergement, mot de passe de keystore).

## FODEC + refonte PDF (post-étape 17, sur retour utilisateur)

En comparant la maquette aux vrais documents (facture/devis) de l'atelier, un
écart de fond est apparu : le FODEC (taxe tunisienne 1 % sur les produits
manufacturés) n'existait nulle part dans le schéma, alors que la TVA réelle
se calcule sur une assiette qui l'inclut. Ajouté proprement plutôt que
seulement corrigé dans le PDF :

- `017_fodec.sql` : `societe.taux_fodec` (1 % par défaut, modifiable),
  colonnes `montant_fodec` sur les lignes et `fodec` sur les documents du
  cycle vente uniquement (devis, commande client, facture, avoir — jamais
  achats, dont les factures fournisseur portent déjà leur propre FODEC).
  Nouvel ordre de calcul : `montant_ht_ligne` → `montant_fodec_ligne` →
  `montant_tva_ligne = (ht + fodec) × taux_tva`.
- `core/utils/nombre_en_lettres.dart` : conversion Decimal → français
  toutes lettres (« Deux mille neuf cent soixante-neuf dinars six cent
  quatre-vingt-treize millimes »), vérifiée par calcul manuel contre les deux
  exemples fournis par l'utilisateur — résultat identique au montime près.
- `core/pdf/document_pdf.dart` réécrit : palette vert/orangé, encadré logo
  (placeholder, logo réel à intégrer par l'utilisateur), tableau de lignes à
  4 colonnes, encadré récapitulatif (Total/Fodec/Total HT/TVA/Timbre/TTC) +
  montant en lettres, pied de page MF/Adresse/Tel pour le devis.
- Le BL reste volontairement sans prix (décision utilisateur confirmée) :
  seuls Devis et Facture portent cette maquette.

## Décisions et simplifications assumées

- **Saisie de lignes** : formulaires clavier-navigables classiques plutôt que
  `PlutoGrid` en édition inline pour les lignes de document (devis/facture/…).
  `PlutoGrid` reste obligatoire — et utilisé — sur tous les écrans de liste.
  Compromis de vitesse de développement, documenté ici pour rester honnête sur
  l'écart avec la section 5 de PROJET.md (« saisie clavier façon tableur »).
- Immuabilité des documents validés : un seul trigger générique
  `app.proteger_document()` par famille (documents standards / OF), plutôt
  qu'un trigger par table.
- `mouvement_stock` : immuabilité forcée par trigger `BEFORE UPDATE OR DELETE`,
  indépendamment des policies RLS.
- Numérotation : assignée uniquement à la validation (voir migration 015),
  jamais à la création d'un brouillon.

## En attente côté utilisateur

- Renseigner `societe` avec les vraies informations (raison sociale,
  matricule fiscal, adresse) — actuellement des valeurs placeholder.
- Tester chaque cycle de bout en bout avec des données réelles.
- Fournir les infos de build de production (keystore Android, hébergeur web)
  quand prêt pour l'étape 17 finale.
