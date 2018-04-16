#!/bin/bash

curl "http://localhost:4741/orders" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
