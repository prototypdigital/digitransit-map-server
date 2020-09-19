#!/bin/bash

#start map server

cd ${WORK} && \
node_modules/.bin/forever start -c "node " \
node_modules/.bin/tessera \
--port 8080 otpstops://${CROATIA_OTP_URL} \
--multiprocess \
-r tilelive-otp-stops \
&& sleep 10 && node_modules/.bin/forever --fifo logs 0
