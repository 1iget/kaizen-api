#!/bin/bash

curl "http://localhost:4741/orders/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "order": {
      "status": "OPEN",
      "item_id": 20
    }
  }'

echo
