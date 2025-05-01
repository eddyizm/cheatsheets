# holy crap caddy is simple
caddy reverse-proxy --from <DOMAIN> --to http://<REVERSE_IP>:<PORT>

# set up service to run after installing binary and adding to $PATH
which caddy # /usr/bin/caddy

sudo groupadd --system caddy

# hash password for basic auth
caddy hash-password
	[-p, --plaintext <password>]
	[-a, --algorithm <name>]

# set config to read a auth file or files
handle_path /protected* {
        basicauth {
                import hashedpasswords.auth.*
        }

        reverse_proxy http://localhost:9200
}
