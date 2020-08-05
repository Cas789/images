#!/bin/bash
#curl https://api.scpslgame.com/ip.php
echo "Hello!"
cd /home/container || exit
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"

cd /home/container &&

echo "Checking verkey.txt.."
if [ ! -d "/home/container/.config/SCP Secret Laboratory" ];
then mkdir "/home/container/.config/SCP Secret Laboratory";
fi
echo "Creating file.."
touch "/home/container/.config/SCP Secret Laboratory/verkey.txt"

cd /home/container/scp_server &&
${MODIFIED_STARTUP}