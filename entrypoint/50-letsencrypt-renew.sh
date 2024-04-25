#!/bin/sh
set -eu

# Run certbot renew in the background on startup
./scripts/run_certbot &
