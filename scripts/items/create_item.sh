#!/bin/bash

curl "http://localhost:4741/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "Sample Item Entry",
      "description": "Sample Item Description",
      "price": 9.99,
      "category": "Entrees"
    }
  }'

echo
