#!/bin/bash

[[ -z $REDISC_daemonize ]] && REDISC_daemonize=no && export $REDISC_daemonize




case ${REDIS_ROLE} in 
master)
  echo "this is a master redis node"
  # some basic conf
  [[ -z $REDISC_PORT ]] && REDISC_PORT=6379 && export $REDISC_PORT
  [[ -z $REDISC_timeout ]] && REDISC_timeout=300 && export $REDISC_timeout
  [[ -z $REDISC_loglevel ]] && REDISC_loglevel=warning && export $REDISC_loglevel
  [[ -z $REDISC_databases ]] && REDISC_databases=16 && export $REDISC_databases
  [[ -z $REDISC_dir ]] && REDISC_dir=/data && export $REDISC_dir
  [[ -z $REDISC_maxclients ]] && REDISC_maxclients=10000 && export $REDISC_maxclients
  [[ -z $REDISC_maxmemory ]] && REDISC_maxmemory=1000mb && export $REDISC_maxmemory
  [[ -z $REDISC_maxmemory_policy ]] && REDISC_maxmemory_policy=allkeys-lru && export $REDISC_maxmemory_policy
  [[ -z $REDISC_appendonly ]] && REDISC_appendonly=no && export $REDISC_appendonly
  [[ -z $REDISC_appendfsync ]] && REDISC_appendfsync=always && export $REDISC_appendfsync
  # passwd conf
  [[ $REDIS_PASS ]] && REDISC_requirepass=$(echo ${REDIS_PASS}) && REDISC_masterauth=$(echo ${REDIS_PASS}) && export $REDISC_requirepass $REDISC_masterauth
  # create conf file
  env2file create --path redis.conf --perm 0755 --format redis
  ;;
slave)
  echo "this is a slave redis node"
  [[ -z $REDISC_PORT ]] && REDISC_PORT=6379 && export $REDISC_PORT
  [[ -z $REDISC_timeout ]] && REDISC_timeout=300 && export $REDISC_timeout
  [[ -z $REDISC_loglevel ]] && REDISC_loglevel=warning && export $REDISC_loglevel
  [[ -z $REDISC_databases ]] && REDISC_databases=16 && export $REDISC_databases
  [[ -z $REDISC_dir ]] && REDISC_dir=/data && export $REDISC_dir
  [[ -z $REDISC_maxclients ]] && REDISC_maxclients=10000 && export $REDISC_maxclients
  [[ -z $REDISC_maxmemory ]] && REDISC_maxmemory=1000mb && export $REDISC_maxmemory
  [[ -z $REDISC_maxmemory_policy ]] && REDISC_maxmemory_policy=allkeys-lru && export $REDISC_maxmemory_policy
  [[ -z $REDISC_appendonly ]] && REDISC_appendonly=no && export $REDISC_appendonly
  [[ -z $REDISC_appendfsync ]] && REDISC_appendfsync=always && export $REDISC_appendfsync
  # passwd conf
  [[ $REDIS_PASS ]] && REDISC_requirepass=$(echo ${REDIS_PASS}) && REDISC_masterauth=$(echo ${REDIS_PASS}) && export $REDISC_requirepass $REDISC_masterauth
  # create conf file
  env2file create --path redis.conf --perm 0755 --format redis
  ;;
sentinel)
  echo "this is a sentinel redis node"
  ;;
*)
  echo "you need set a role for this redis node , exiting"
  exit 1
  ;;
esac