#!/usr/bin/with-contenv bash
set -Eeuo pipefail

if [[ ! -f /data/homeserver.yaml ]]; then
	echo "/data/homeserver.yaml file not found, generating..."
	/start.py generate
fi
