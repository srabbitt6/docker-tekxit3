#!/bin/bash
shopt -s extglob; set +H
wget ${MEGA_URL} -O mc.zip
unzip mc.zip -d /data-temp
#mv -v data-temp/*/* data/
mv -v data-temp/*/!(server.properties|ops.json|banned-ips.json|banned-players.json|whitelist.json|usercache.json) data/
rm -r -f /data-temp 
rm -r -f ./mc.zip
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xms${INIT_MEM}" "-Xmx${MAX_MEM}" "-XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled" -jar $jarfile nogui
