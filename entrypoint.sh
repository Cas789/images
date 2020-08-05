#!/bin/bash
#curl https://api.scpslgame.com/ip.php
echo "Hello!"
cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

./Exiled.Installer-Linux -p /home/container/scp_server --pre-releases
cd .config &&

/home/container/scp_server/SCPSL_Data/Managed &&
cd /home/container &&

echo "Checking verkey.txt.."
if [ ! -d "/home/container/.config/SCP Secret Laboratory" ];
then mkdir "/home/container/.config/SCP Secret Laboratory";
fi
echo "Touching file.."
touch "/home/container/.config/SCP Secret Laboratory/verkey.txt"
echo "Verifying key contents.."
echo "VERIFIED HOST000" > "/home/container/.config/SCP Secret Laboratory/verkey.txt"
echo "Contents verified."

if [ -f "/home/container/.config/EXILED/Plugins/DiscordIntegration_Plugin.dll" ]; then 
cd /home/container/DiscordIntegration && 
mono DiscordIntegration_Bot.exe > /home/container/DiscordIntegration/logs/latest.log &
cd /home/container/scp_server &&
${MODIFIED_STARTUP};
else
cd /home/container/scp_server &&
${MODIFIED_STARTUP};
fi