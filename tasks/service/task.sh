#!/bin/sh

set -o errexit
set -o pipefail

apk add --no-cache jq

kubectl --insecure-skip-tls-verify --server $k8s_server  --token $k8s_token --namespace $k8s_namespace get service $k8s_service -o json | jq -r '.status.loadBalancer.ingress | .[0].ip' > out/service_ip