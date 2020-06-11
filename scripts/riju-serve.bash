#!/usr/bin/env bash

set -e
set -o pipefail

TLS=1
TLS_PRIVATE_KEY="$(base64 /etc/letsencrypt/live/riju.codes/privkey.pem)"
TLS_CERTIFICATE="$(base64 /etc/letsencrypt/live/riju.codes/fullchain.pem)"

# Do this separately so that errors in command substitution will crash
# the script.
export TLS TLS_PRIVATE_KEY TLS_CERTIFICATE

docker run -e TLS -e TLS_PRIVATE_KEY -e TLS_CERTIFICATE \
       --rm -p 0.0.0.0:80:6119 -p 0.0.0.0:443:6120 riju:prod
