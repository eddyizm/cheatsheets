# holy crap caddy is simple
caddy reverse-proxy --from <DOMAIN> --to http://<REVERSE_IP>:<PORT>

# set up service to run after installing binary and adding to $PATH
which caddy # /usr/bin/caddy

sudo groupadd --system caddy
