#!/bin/bash

set -o errexit
set -o errtrace
set -o pipefail

cd ./repo
mkdir -p bin
go build main