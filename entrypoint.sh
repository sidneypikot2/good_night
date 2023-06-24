#!/bin/bash
set -e
rm -f /good_night/tmp/pids/server.pid
exec "$@"