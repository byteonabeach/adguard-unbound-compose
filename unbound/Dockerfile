FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends unbound unbound-anchor ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY unbound.conf /etc/unbound/unbound.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
 && mkdir -p /var/lib/unbound

EXPOSE 5335/tcp 5335/udp

ENTRYPOINT ["/entrypoint.sh"]
