#!/bin/bash
cd /home/container &&
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo "/home/container/scpsl$: ${MODIFIED_STARTUP}"

if [[ -n ${APPID} ]] && [[ ${SERVER_UPDATE} == 1 ]]; then
	echo "Updating SCP:SL..."
	./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container/scpsl +app_update "${APPID}" validate +quit
	echo "Update Complete."
fi

if [[ ${EXILED_UPDATE} == 1 ]]; then
	echo "Updating Exiled..."
	cd /home/container/scpsl &&
	wget -O /home/container/scpsl/Exiled.Installer-Linux https://github.com/galaxy119/EXILED/releases/latest/download/Exiled.Installer-Linux
	./Exiled.Installer-Linux -p /home/container/scpsl --pre-releases --exit
	echo "Update Complete."
fi

if [[ ${MULTIADMIN_UPDATE} == 1 ]]; then
	echo "Updating MultiAdmin..."
	cd /home/container/scpsl &&
	wget -O /home/container/scpsl/MultiAdmin.exe https://github.com/ServerMod/MultiAdmin/releases/latest/download/MultiAdmin.exe
	echo "Update Complete."
fi

cd /home/container/scpsl &&
${MODIFIED_STARTUP}