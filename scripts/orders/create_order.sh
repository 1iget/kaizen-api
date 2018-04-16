#!/bin/bash

curl "http://localhost:4741/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "name": "Sample Item Entry",
      "description": "Sample Item Description",
      "price": 9.99,
      "category": "Entrees"
    }
  }'

echo
t.text "name"
t.money "price", scale: 2
t.integer "qty"
t.text "prep"
t.text "status"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.bigint "user_id"
t.index ["user_id"], name: "index_orders_on_user_id"
