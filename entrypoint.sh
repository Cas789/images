#!/bin/bash
cd /home/container &&
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

if [[ -n ${APPID} ]] && [[ ${SERVER_UPDATE} == 1 ]]; then
	echo "Updating SCP:SL..."
	./steamcmd.sh +login anonymous +force_install_dir /home/container/scp_server +app_update "${APPID}" validate +quit
	echo "Update Complete."
fi

if [[ ${EXILED_UPDATE} == 1 ]]; then
	echo "Updating Exiled..."
	./Exiled.Installer-Linux -p /home/container/scp_server --pre-releases
	echo "Update Complete."
fi

cd /home/container/scp_server &&
${MODIFIED_STARTUP}