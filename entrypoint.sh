#!/bin/sh
vlmcsd-bin -D -d &
export SECRET_KEY="${PLAYIT_SECRET_KEY:-$SECRET_KEY}"
playit --secret "$SECRET_KEY" &
PORT=${PORT:-10000}
python3 -m http.server "$PORT"
