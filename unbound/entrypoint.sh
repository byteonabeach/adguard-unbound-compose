#!/bin/sh
set -eu

mkdir -p /var/lib/unbound

# Generate a trust anchor for DNSSEC validation if needed.
if [ ! -s /var/lib/unbound/root.key ]; then
  unbound-anchor -a /var/lib/unbound/root.key || true
fi

exec unbound -d -c /etc/unbound/unbound.conf
