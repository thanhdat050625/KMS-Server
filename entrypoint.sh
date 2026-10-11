#!/bin/sh
vlmcsd-bin -D -d &
playit --secret "$PLAYIT_SECRET_KEY" run &
PORT=${PORT:-10000}
python3 -m http.server "$PORT"
