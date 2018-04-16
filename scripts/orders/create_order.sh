#!/bin/bash

curl "http://localhost:4741/orders" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "status": "OPEN",
      "item_id": 20
    }
  }'

echo
