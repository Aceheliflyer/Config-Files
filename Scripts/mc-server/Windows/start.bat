@echo off
rem This script starts a minecraft server on Windows machines.
rem To start servers with this script place it next to your server jar file.
rem Syntax: start.bat <instance name>

if [%1]==[] goto restart

if "%~1"=="-FIXED_CTRL_C" (
  shift
) else (
  call <nul %0 -FIXED_CTRL_C %*
  goto :eof
)

REM Config
set InstanceName=%1
set MinecraftHome=%~dp0

echo Minecraft directory: %MinecraftHome%
cd %MinecraftHome%

:minecraft
echo [%time%] Minecraft started.
REM start /wait java -Xms2G -Xmx2G -jar %1 nogui
start /wait java -Xms10G -Xmx10G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %1 nogui
echo [%time%] WARNING: Minecraft closed or crashed, restarting.
ping 127.0.0.1 -n 3 >nul
goto minecraft

:restart
set /p InstanceName= "Instance: "
%0 %InstanceName%
