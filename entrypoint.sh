#!/bin/bash
#curl https://api.scpslgame.com/ip.php
cd /home/container &&
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

if [[ -n ${APPID} ]]; then
	./steamcmd.sh +login anonymous +force_install_dir /home/container/scp_server +app_update "${APPID}" validate +quit
fi

if [[ ${EXILED_UPDATE} == 1 ]]; then
	./Exiled.Installer-Linux -p /home/container/scp_server --pre-releases
fi

cd /home/container/scp_server &&
${MODIFIED_STARTUP}