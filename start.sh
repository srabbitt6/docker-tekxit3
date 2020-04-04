#!/bin/bash
jarfile=$(cd /data && ls|grep forge-*.jar)
cd /data && java -server "-Xms${INIT_MEM}" "-Xmx${MAX_MEM}" -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -jar $jarfile nogui
