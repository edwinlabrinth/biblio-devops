# Changelog

Toutes les versions notables de Biblio sont documentées dans ce fichier.
Le format suit [Keep a Changelog](https://keepachangelog.com/fr/1.1.0/)
et le versionnage suit [SemVer](https://semver.org/lang/fr/).

## [Unreleased]

## [1.0.1] - 2026-10-30
### Fixed
- Sortie propre du menu lorsque l'entrée standard est fermée (mode conteneur).
- Vérification du tag d'image dans le workflow de release (`v1.0.0` -> `1.0.0`).
### Added
- Smoke test CI sur la fin de STDIN pour prévenir la régression.

## [1.0.0] - 2026-10-30
### Added
- Modèles `Livre`, `Membre` et `Bibliotheque` avec validation des ISBN,
  limite de trois emprunts et recherche insensible à la casse.
- Menu interactif de gestion de la bibliothèque.
- Suite de 39 assertions et harnais de tests avec code retour bloquant.
- Image Docker multi-stage : tests exécutés au build, utilisateur non-root,
  exécution en lecture seule.
- Chaîne GitHub Actions : lint PHP, tests, quality gate, smoke test Docker.
- Workflow de release avec tags SemVer (`1.0.0`, `1.0`, `1`, `latest`).
- Protection des branches `main` et `develop` et modèle de pull request.

## [0.1.0] - 2026-10-30
### Added
- Initialisation du dépôt et de la structure du projet Biblio.
