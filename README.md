# Bloopa

Application Flutter multi-plateforme dédiée à la recherche et à la mise en avant de produits reconditionnés. L'interface met l'accent sur une recherche intelligente, des listes responsives et un routage optimisé pour le web (SEO et URLs propres).

## Aperçu rapide
- Interface Flutter Material 3 avec thèmes clair/sombre (`lib/ui/themes`)
- Routage via `go_router` + observateur SEO pour les builds web (`lib/router.dart`, `lib/seo/*`)
- Composants réutilisables pour la recherche, l'app bar et les cartes produit (`lib/ui/widgets`)
- Responsive design (desktop, tablette, mobile) grâce à `ResponsiveWidget` et au calcul dynamique des grilles (`lib/utils/responsive.dart`)
- Données simulées pour les listes produits afin de valider l'UI avant branchement à une API

## Architecture
```
lib/
├── main.dart               # Point d'entrée + MaterialApp.router
├── global.dart             # Constantes globales (brand, URL, mode debug)
├── router.dart             # Définition des routes et SEO
├── seo/                    # Meta manager spécifique web
├── ui/
│   ├── screens/            # Écrans (Home, ProductList)
│   ├── themes/             # Thèmes, palette et typographies
│   └── widgets/            # AppBar, BottomBar, formulaires, listes, cartes
├── utils/responsive.dart   # Helper responsive + hauteur AppBar
└── services, logic, datas  # Emplacements prévus pour la future logique métier
assets/
├── brand/                  # Logos et illustrations
├── icon.png                # Source utilisée par flutter_launcher_icons
└── .env                    # Variables d'environnement (non versionnées)
```

## Prérequis
- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.24 (Dart 3.9.2 min., cf. `pubspec.yaml`)
- Android Studio / Xcode / VS Code (pour les émulateurs ou les devices réels)
- Chrome ou Edge pour le debug web
- Un fichier `.env` à la racine si vous consommez des secrets (chargé via `flutter_dotenv`)

## Installation & configuration
1. Cloner le dépôt puis se placer dans le dossier `bloopa`.
2. Vérifier la version Flutter : `flutter --version`.
3. Installer les dépendances : `flutter pub get`.
4. (Optionnel) Générer les icônes : `flutter pub run flutter_launcher_icons`.
5. Créer un `.env` si nécessaire (voir exemple ci-dessous).

Exemple `.env` :
```
API_BASE_URL=https://api.bloopa.com
SENTRY_DSN=<clé>
```

## Lancer l'application
| Cible        | Commande                                   |
|-------------|---------------------------------------------|
| Mobile      | `flutter run -d <deviceId>`                 |
| Web         | `flutter run -d chrome --web-renderer html` |
| Desktop     | `flutter run -d macos` (si activé)          |

> Les URLs web utilisent `PathUrlStrategy` pour supprimer le `#`, pensez à configurer votre serveur (rewrite vers `index.html`).

## Scripts utiles
- `flutter pub get` : met à jour les dépendances.
- `dart run build_runner watch` : à utiliser si vous ajoutez de la génération de code (non actif par défaut).
- `flutter pub run flutter_launcher_icons` : régénère les icônes multi-plateforme.
- `flutter clean && flutter pub get` : remet le cache à plat en cas de souci.

## Tests & qualité
- Lancer les tests unitaires : `flutter test`.
- Analyse statique : `dart analyze`.
- Ajoutez des tests UI/widget pour les composants critiques (`test/`).

## Notes sur le SEO web
- `SeoObserver` applique titre, description et URL canonique à chaque navigation.
- Les routes doivent fournir un `SeoData` (cf. `router.dart`) pour éviter les balises génériques.
- Complétez `MetaManager` si vous avez besoin d'OpenGraph, JSON-LD ou d'autres métadonnées.

## Ressources à personnaliser
- Thèmes : `lib/ui/themes/bloopaLightTheme.dart` & `bloopaDarkTheme.dart`
- Branding : `assets/brand/` et `globalBrandName` dans `lib/global.dart`
- Bottom bar / App bar : `lib/ui/widgets/appBar` et `bottomBar`

## Prochaines étapes possibles
1. Brancher une API réelle et déplacer la logique dans `services/` + `logic/`.
2. Remplir `datas/` avec des fixtures typées ou supprimer les mockups.
3. Ajouter des tests dorés pour figer les composants UI clés.
4. Configurer le déploiement web (Firebase Hosting, Vercel ou autre) avec les règles de réécriture nécessaires.
