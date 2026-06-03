@echo off
color 1f
title=Game Server 1
SET BASE=C:\XxSG
%BASE%\Java\jdk1.8.0_181\bin\java -Duser.language=en -Duser.country=US -Duser.variant= -Dfile.encoding=utf-8 -cp %BASE%\game\lib\*;%BASE%\game\target\classes com.linlongyx.sanguo.webgame.startup.GameServer
pause
