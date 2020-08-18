FROM python:3.7-slim as builder

RUN apt-get update && apt-get install -yy \
    build-essential libpq-dev libssl-dev libffi-dev python3-dev curl libxml2-dev libxslt-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --prefix="/dist/usr/local" --no-warn-script-location \
    frozendict \
    jaeger-client \
    opentracing \
    prometheus-client \
    psycopg2 \
    pycparser \
    pyrsistent \
    pyyaml \
    simplejson \
    threadloop \
    thrift

RUN mkdir -p synapse && \
    curl -sL "https://github.com/matrix-org/synapse/archive/v1.19.0.tar.gz" | tar xz -C synapse --strip-component 1

RUN pip install --prefix="/dist/usr/local" --no-warn-script-location \
    /synapse[all]

RUN cp /synapse/docker/start.py /dist/start.py && \
    cp -r /synapse/docker/conf /dist/conf && \
    chmod +x /dist/start.py

# Copy riot web app into container
# COPY --from=vectorim/riot-web /app /dist/webapp

COPY rootfs/ /dist/

FROM homelabs/base:buster-python

RUN apt-get update && apt-get install -yy \
    libpq5 xmlsec1 gosu && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /dist /

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    S6_KILL_GRACETIME=15000

VOLUME ["/data"]
EXPOSE 8008/tcp 8009/tcp 8448/tcp
