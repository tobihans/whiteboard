#!/usr/bin/env bash

docker compose up -d && \
  caddy reverse-proxy --from "${WHITEBOARD_HOST:-192.168.0.134:8081}" \
  --to "$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' studx_whiteboard):8080"
  --change-host-header
