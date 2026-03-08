FROM caddy:2.11.1-builder AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@v0.0.0-20251204174556-6dc1fbb7e925 \
    --with github.com/mholt/caddy-l4/modules/l4proxy@v0.0.0-20260304182434-d882e9c2661d \
    --with github.com/mholt/caddy-l4/modules/l4tls@v0.0.0-20260304182434-d882e9c2661d \
    --with github.com/mholt/caddy-l4/modules/l4proxyprotocol@v0.0.0-20260304182434-d882e9c2661d

FROM caddy:2.11.1
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY index.html /usr/share/caddy/index.html