#!/bin/bash
REGISTRY_HOST="${COUCHDB_PORT_5984_TCP_ADDR}"
REGISTRY_PORT="${COUCHDB_PORT_5984_TCP_PORT}"
CACHE_HOST="${REDIS_PORT_6379_TCP_ADDR}"
CACHE_PORT="${REDIS_PORT_6379_TCP_PORT}"

# make config up to date
if [ -f "_browsenpm.json" ]
then
  sed 's%REGISTRY_HOST%'${REGISTRY_HOST}'%' _browsenpm.json > _browsenpm.tmp1.json
  sed 's%REGISTRY_PORT%'${REGISTRY_PORT}'%' _browsenpm.tmp1.json > _browsenpm.tmp2.json
  sed 's%CACHE_HOST%'${CACHE_HOST}'%' _browsenpm.tmp2.json > _browsenpm.tmp1.json
  sed 's%CACHE_PORT%'${CACHE_PORT}'%' _browsenpm.tmp1.json > _npm_ui.json
  rm _browsenpm.tmp1.json _browsenpm.tmp2.json
fi

# update dependencies
npm install

# Start browsenpm
bin/server -c _npm_ui.json
