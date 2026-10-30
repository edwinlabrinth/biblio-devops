# Biblio

Application PHP en ligne de commande pour gérer une bibliothèque
(livres, adhérents, emprunts).

Projet réalisé dans le cadre de l'examen TP DevOps (GINF2, ENSA Tanger) :
GitFlow, GitHub Actions et conteneurisation Docker.

## Prérequis

- PHP 8.2 ou supérieur
- Docker (optionnel)

## Utilisation

```bash
php index.php
```

## Tests

```bash
php tests/run.php
```

## Docker

```bash
docker build -t biblio:1.0.0 .
docker run --rm -it biblio:1.0.0
```

## Organisation Git

- `main` : versions publiées (tags SemVer)
- `develop` : intégration continue
- `feature/*`, `release/*`, `hotfix/*` : branches de travail

## Auteur

LACHHAB Mohammed — GINF2
