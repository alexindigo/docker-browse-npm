docker-browse-npm
=================

Containerized [browsenpm.org](https://www.npmjs.org/package/browsenpm) for local deployment,
using redis, couchdb `1.6.0`, node `0.10.29`.

Requires:
- [alexindigo/couchdb](https://registry.hub.docker.com/u/alexindigo/couchdb/) as linked container.
- [redis](https://registry.hub.docker.com/_/redis/) as linked container.

## Install

Copy [browsenpm.org repo](https://github.com/nodejitsu/browsenpm.org) to `www` folder,
and adjust it to your liking.

## Run

Start browse-npm server:

```
$ ./run.sh
```
