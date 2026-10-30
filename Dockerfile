# syntax=docker/dockerfile:1.7

FROM php:8.4-cli-alpine AS base

LABEL org.opencontainers.image.title="Biblio" \
      org.opencontainers.image.description="Gestion de bibliotheque en ligne de commande" \
      org.opencontainers.image.source="https://github.com/edwinlabrinth/biblio-devops" \
      org.opencontainers.image.licenses="MIT"

WORKDIR /app

COPY autoload.php index.php VERSION ./
COPY src ./src
COPY tests ./tests

# Isolation : execution avec un utilisateur non privilegie
RUN addgroup -S biblio \
    && adduser -S -G biblio biblio \
    && chown -R biblio:biblio /app
USER biblio

# Quality gate au build : le build echoue si un test echoue
FROM base AS test
RUN php tests/run.php

# Image finale : elle ne peut etre construite que si l'etape de tests a reussi
FROM test AS runtime
ENTRYPOINT ["php", "index.php"]
