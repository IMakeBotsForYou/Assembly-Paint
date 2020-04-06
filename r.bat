@echo off

tasm/zi %1
set errorany=0

IF ERRORLEVEL 1 set errorany=1

if %errorany%==0 tlink/v %1

if %errorany%==0 td %1