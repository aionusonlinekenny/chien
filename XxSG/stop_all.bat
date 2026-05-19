@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

title Stopping_All_Services_Admin
timeout /t 1 /nobreak >nul

echo Stopping all services with Admin privileges...

taskkill /F /IM nginx.exe /T /FI "STATUS eq RUNNING" 2>nul
taskkill /F /IM mysqld.exe /T /FI "STATUS eq RUNNING" 2>nul
taskkill /F /IM php-cgi.exe /T /FI "STATUS eq RUNNING" 2>nul
taskkill /F /IM java.exe /T /FI "STATUS eq RUNNING" 2>nul
taskkill /F /IM redis-server.exe /T /FI "STATUS eq RUNNING" 2>nul

echo.
echo Closing other CMD windows...
:: Kill all CMD instances that DO NOT have our specific title.
taskkill /F /FI "WINDOWTITLE ne Stopping_All_Services_Admin" /IM cmd.exe 2>nul

echo.
echo All services stopped successfully!
echo.
pause
