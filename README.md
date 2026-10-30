# Biblio

[![CI](https://github.com/edwinlabrinth/biblio-devops/actions/workflows/ci.yml/badge.svg)](https://github.com/edwinlabrinth/biblio-devops/actions/workflows/ci.yml)
[![Release](https://github.com/edwinlabrinth/biblio-devops/actions/workflows/release.yml/badge.svg)](https://github.com/edwinlabrinth/biblio-devops/actions/workflows/release.yml)

Application PHP en ligne de commande pour gérer une bibliothèque
(livres, adhérents, emprunts). Projet réalisé dans le cadre de l'examen TP
DevOps (GINF2, ENSA Tanger) : GitFlow, GitHub Actions et Docker.

## Fonctionnalités

- ajout, liste et recherche de livres ;
- validation des ISBN (10 ou 13 chiffres) ;
- emprunt et rendu d'un livre ;
- limite de 3 emprunts par adhérent ;
- refus des doublons d'ISBN.

## Architecture

| Fichier | Rôle |
| --- | --- |
| `index.php` | menu interactif en ligne de commande |
| `src/Livre.php` | modèle d'un livre |
| `src/Membre.php` | modèle d'un adhérent et de ses emprunts |
| `src/Bibliotheque.php` | catalogue et recherche |
| `tests/run.php` | harnais de tests (code retour 0/1) |
| `Dockerfile` | image multi-stage avec tests au build |
| `.github/workflows/ci.yml` | lint, tests, quality gate, Docker |
| `.github/workflows/release.yml` | image multi-tags SemVer |

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

La suite contient 39 assertions. Le script retourne un code non nul si une
assertion échoue, ce qui rend le quality gate bloquant en CI.

## Docker

```bash
# Construction : les tests sont exécutés pendant le build
docker build -t biblio:1.0.0 .

# Exécution éphémère et isolée
docker run --rm -it --read-only --tmpfs /tmp biblio:1.0.0
```

Avec Compose :

```bash
docker compose run --rm biblio
```

## Intégration et livraison continues

- `CI` : déclenché sur `push` et `pull_request` vers `main` et `develop`.
  Le job `Tests & Quality Gate` est obligatoire pour fusionner une PR.
- `Release` : déclenché par un tag `vX.Y.Z`, il reconstruit l'image avec les
  tags `X.Y.Z`, `X.Y`, `X` et `latest`.
- La publication Docker Hub est optionnelle et désactivée par défaut
  (variable `DOCKERHUB_ENABLED=true`).

## Organisation Git

| Branche | Rôle |
| --- | --- |
| `main` | versions publiées, protégée, tags SemVer |
| `develop` | intégration continue, protégée |
| `feature/*` | une fonctionnalité, fusionnée par PR |
| `release/*` | préparation d'une version |
| `hotfix/*` | correction urgente depuis `main` |

Convention de commits : `type: description` avec `feat`, `fix`, `test`, `ci`,
`build`, `docs`, `chore` ou `refactor`. Les branches sont rebasées avant
publication et les fusions se font avec un commit de merge (`--no-ff`).

## Auteur

LACHHAB Mohammed — GINF2
