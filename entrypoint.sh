#!/bin/bash
#curl https://api.scpslgame.com/ip.php
echo "Server boot started"
cd /home/container &&

# Install Exiled
echo "Installing Exiled"
./Exiled.Installer-Linux -p /home/container/scp_server --pre-releases
cd /home/container &&

# Update Server
echo "Checking for updates"
if [ ! -z ${APPID} ]; then
	./steamcmd.sh +login anonymous +force_install_dir /home/container/scp_server +app_update ${APPID} validate +quit
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

cd /home/container/scp_server &&
${MODIFIED_STARTUP}