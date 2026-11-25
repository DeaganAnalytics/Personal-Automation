@echo off

echo This program will automatically open Outlook, Teams and Edge.

echo Opening Outlook.
start "" "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"

echo Opening Microsoft Teams.
start "" "C:\Program Files\WindowsApps\MSTeams_24102.2223.2870.9480_x64__8wekyb3d8bbwe\ms-teams.exe"

echo Opening Microsoft Edge.
start "" "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

echo Closing Lifesize
taskkill /IM Lifesize.exe /F

echo All applications have been launched.
exit
