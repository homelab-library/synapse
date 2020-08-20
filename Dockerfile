# === Builder
FROM python:3.8-buster as builder

RUN apt-get update && apt-get install -yy \
    build-essential libpq-dev libssl-dev libffi-dev python3-dev curl libxml2-dev libxslt-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --prefix="/dist/usr/local" --extra-index-url "https://www.piwheels.org/simple" matrix-synapse

COPY rootfs/ /dist/

# === Target
FROM homelabs/base:python38

RUN apt-get update && apt-get install -yy \
    libpq5 xmlsec1 gosu && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /data

COPY --from=builder /dist /

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_KILL_GRACETIME=15000

VOLUME ["/data"]
EXPOSE 8008/tcp 8009/tcp 8448/tcp
