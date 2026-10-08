@echo off
setlocal
echo Launching 1-Click Environment Setup for D:\MY project...
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0setup_new_laptop.ps1"
echo.
pause
