#!/bin/bash
#curl https://api.scpslgame.com/ip.php
cd /home/container || exit

# Update Server
if [ ! -z ${APPID} ]; then
	./steamcmd.sh +login anonymous +force_install_dir /home/container/scp_server +app_update ${APPID} validate +quit
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

cd /home/container/scp_server &&
${MODIFIED_STARTUP}