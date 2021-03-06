#!/bin/bash

set -o errexit
set -o errtrace
set -o pipefail

cd ./repo
go build -ldflags "-linkmode external -extldflags -static" -a main.go
ls -l
mv main ../out/main
mv ../tools/tasks/build/Dockerfile ../out/Dockerfile