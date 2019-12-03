#!/bin/bash

#workaround for azure DNS issue

if [ -n "$MESOS_CONTAINER_NAME"  ]; then 
  echo -e "\nsearch marathon.l4lb.thisdcos.directory" >> /etc/resolv.conf
fi

#start map server

cd ${WORK} && \
node_modules/.bin/forever start -c "node ${NODE_OPTS}" \
node_modules/tessera/bin/tessera.js --port 8080 --config config.js --multiprocess \
-r ${WORK}/node_modules/tilelive-otp-stops/ \
&& sleep 10 && node_modules/.bin/forever --fifo logs 0
