#!/bin/bash
REGISTRY_HOST="${COUCHDB_PORT_5984_TCP_ADDR}"
REGISTRY_PORT="${COUCHDB_PORT_5984_TCP_PORT}"
CACHE_HOST="${REDIS_PORT_6379_TCP_ADDR}"
CACHE_PORT="${REDIS_PORT_6379_TCP_PORT}"

# make config up to date
if [ -f "/www/_browsenpm.json" ]
then
  sed 's%REGISTRY_HOST%'${REGISTRY_HOST}'%' /www/_browsenpm.json > /www/_browsenpm.tmp1.json
  sed 's%REGISTRY_PORT%'${REGISTRY_PORT}'%' /www/_browsenpm.tmp1.json > /www/_browsenpm.tmp2.json
  sed 's%CACHE_HOST%'${CACHE_HOST}'%' /www/_browsenpm.tmp2.json > /www/_browsenpm.tmp1.json
  sed 's%CACHE_PORT%'${CACHE_PORT}'%' /www/_browsenpm.tmp1.json > /www/_npm_ui.json
  rm /www/_browsenpm.tmp1.json /www/_browsenpm.tmp2.json
fi

# Start browsenpm
/www/bin/server -c /www/_npm_ui.json
