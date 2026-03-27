//go:build tools

package main

import (
	_ "github.com/caddy-dns/cloudflare"
	_ "github.com/caddyserver/caddy/v2"
	_ "github.com/mholt/caddy-l4"
)
