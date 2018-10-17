#!/bin/sh

set -o errexit
set -o errtrace
set -o pipefail

apk add --no-cache jq

kubectl --insecure-skip-tls-verify --namespace $k8s_namespace get service $k8s_service -o json | jq -r '.status.loadBalancer.ingress | .[0].ip' > out/service_ip