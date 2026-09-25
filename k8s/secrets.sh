#!/usr/bin/env bash
# Creates/updates the i27-gateway-env Secret from .env.dev and rolls the deployment.
# Run from the i27-helpdesk-gateway directory:
#   bash k8s/secrets.sh

set -euo pipefail

kubectl create secret generic i27-gateway-env \
  --from-env-file=.env.dev \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl rollout restart deployment/i27-gateway 2>/dev/null || true



kubectl create secret generic i27-gateway-prod --from-env-file=.env.dev -n i27helpdesk-prod