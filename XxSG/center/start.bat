@echo off
color 1f
title=Center Server
SET BASE=C:\XxSG
%BASE%\Java\jdk1.8.0_181\bin\java -Duser.language=en -Duser.country=US -Duser.variant= -Dfile.encoding=utf-8 -cp %BASE%\center\lib\*;%BASE%\center\target\classes com.linlongyx.startup.CrossServer
pause
