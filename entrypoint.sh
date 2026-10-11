#!/bin/sh
vlmcsd-bin -D -d &
export SECRET_KEY="${PLAYIT_SECRET_KEY:-$SECRET_KEY}"
playit --secret "$SECRET_KEY" &

mkdir -p /var/www && echo "<h1>KMS Server is running</h1>" > /var/www/index.html
PORT=${PORT:-10000}
python3 -m http.server "$PORT" -d /var/www
