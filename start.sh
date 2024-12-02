#!/usr/bin/env bash

nginx -c /routes.conf &

cd /otel-lgtm/

./run-all.sh
