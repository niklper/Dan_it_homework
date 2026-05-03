#!/bin/bash

URL=${1}

if [ -z "${URL}" ]; then
  echo "Error! URL/IP is not set as first arg. Exiting..."
  exit 1
fi

echo "Benchmarking: $URL"
for i in {1..5}; do
  TIME_TOTAL=$(curl -o /dev/null -s -w '%{time_total}\n' "$URL")
  echo "Request $i: ${TIME_TOTAL}s"
done
