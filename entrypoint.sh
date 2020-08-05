#!/bin/bash
#curl https://api.scpslgame.com/ip.php
echo "Hello!"
cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

/home/container/scp_server/SCPSL_Data/Managed &&
cd /home/container &&

cd /home/container/scp_server &&
${MODIFIED_STARTUP}