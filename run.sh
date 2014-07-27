#!/bin/bash
BASEPATH=$(dirname $(perl -MCwd=realpath -e "print realpath '$0'"))

# if extra arguments present run it in interactive mode
# otherwise just run it once
if [ $# -eq 0 ]
then
RUN_MODE=""
else
RUN_MODE="-t -i"
fi

# run container
docker run ${RUN_MODE} --name browse_npm -v ${BASEPATH}/www:/www -p 8081:80 --dns 10.0.2.3 --link couchdb:couchdb --link redis:redis --link private_npm:private_npm alexindigo/browse-npm "$@"
