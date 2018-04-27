#!/bin/bash

curl "http://localhost:4741/delete/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json"

echo
