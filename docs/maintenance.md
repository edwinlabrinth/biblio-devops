# Maintenance et Git avancé

Ce document rassemble les commandes utilisées pour les opérations de
maintenance demandées : inspection de l'historique, recherche dichotomique
d'une régression, remise à zéro contrôlée et compensation par revert.

## Inspection de l'historique

```bash
git log --graph --oneline --decorate --all
git log --stat --since="1 week ago"
git show <commit>
git blame src/Bibliotheque.php
```

## Recherche dichotomique (bisect)

```bash
git bisect start
git bisect bad                 # HEAD est cassé
git bisect good <commit_sain>
# git teste chaque commit intermédiaire
git bisect reset
```

## Remise à zéro contrôlée

```bash
# Annuler le dernier commit local en conservant les modifications indexées
git reset --soft HEAD~1

# Conserver les modifications dans le répertoire de travail
git reset --mixed HEAD~1

# Récupérer un commit perdu via le reflog
git reflog
git reset --hard <sha>
```

## Compensation par revert

```bash
git revert <commit>            # crée un commit inverse, sans réécrire l'historique
git revert --no-commit <sha1> <sha2>
git commit -m "revert: ..."
```

Le `revert` est privilégié sur une branche partagée : il préserve l'historique
et reste compatible avec la protection de branche (pas de `push --force`).
