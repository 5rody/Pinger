@echo off
title 
mode con: cols=70 lines=27
color 6                                          
chcp 65001 
cls
echo                        ╦ ╦┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐ 
echo                        ║║║├┤ │  │  │ ││││├┤  
echo                        ╚╩╝└─┘┴─┘└─┘└─┘┴ ┴└─┘ 
set /p IP=[40;32m - Enter Target IP :[40;33m
echo.
title Status - Currently Pinging [%IP%]
:main
PING -n 1 %IP% |  FIND "TTL=" >nul 2>nul
IF ERRORLEVEL 1 goto :fail
IF ERRORLEVEL 0 goto :soon
:soon
echo [40;32mConnected to [40;33m([40;32m%IP%[40;32m[40;33m) [40;32m. [40;33mStatus [40;32m([40;32mOnline[40;32m)
echo.
goto main
:fail
Title Status - Disconnected From [%IP%]
echo [40;33mRequest Timed out [40;33m([40;32m%IP%[40;33m) [40;33m. [40;32mStatus [40;33m([40;32mOffline[40;33m)
echo.
goto main