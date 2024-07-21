#!/usr/bin/env bash

set -e
set -u

podman container list -a --format "{{.ID}}" \
  | xargs -I "{}" podman container rm "{}" --force
podman volume rm docker_mysql-data || true
podman volume rm docker_pgsql-data || true
podman container prune
podman image prune
podman system prune


podman container list --all
podman ps
podman volume list
