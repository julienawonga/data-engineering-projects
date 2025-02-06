# this image gets published to GHCR for production use
ARG py_version=3.12.4

FROM python:$py_version-slim-bullseye AS base

RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y --no-install-recommends \
            build-essential \
            ca-certificates \
            git \
            libpq-dev \
            make \
            openssh-client \
            software-properties-common\
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN python -m pip install --upgrade "pip==24.0" "setuptools==69.2.0" "wheel==0.43.0" --no-cache-dir


FROM base AS dbt-postgres

ARG commit_ref=main

HEALTHCHECK CMD dbt --version || exit 1

WORKDIR /usr/app/dbt/
ENTRYPOINT ["dbt"]

RUN python -m pip install --no-cache-dir "dbt-postgres @ git+https://github.com/dbt-labs/dbt-postgres@${commit_ref}"