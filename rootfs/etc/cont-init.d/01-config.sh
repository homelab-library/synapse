#!/usr/bin/with-contenv bash
set -Eeuo pipefail

if [[ ! -f /data/homeserver.yaml ]]; then
	echo "/data/homeserver.yaml file not found, we will try to generate a config"
    echo "Make sure /data is mapped to a volume and review the config before restarting."
    echo "Ensure environment variables SYNAPSE_SERVER_NAME and SYNAPSE_REPORT_STATS is set."
	python -m synapse.app.homeserver \
        -c /data/homeserver.yaml --generate-config \
        --data-directory /data \
        --config-directory /data \
        -H "${SYNAPSE_SERVER_NAME}" \
        --report-stats "${SYNAPSE_REPORT_STATS}"
    exit 1
fi
