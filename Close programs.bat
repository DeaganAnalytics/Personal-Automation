@echo off

echo Closing Lifesize
taskkill /IM Lifesize.exe /F

echo Closing Outlook
taskkill /IM OUTLOOK.EXE /F

echo Closing Excel
taskkill /IM EXCEL.EXE /F

echo Closing Word
taskkill /IM WINWORD.EXE /F

echo Closing Microsoft Teams
taskkill /IM ms-teams.exe /F

echo Closing Microsoft Edge
taskkill /IM msedge.exe /F

echo Closing R Studio
taskkill /IM rstudio.exe /F

echo Closing PyCharm
taskkill /IM pycharm64.exe /F

echo Closing Datagrip
taskkill /IM datagrip64.exe /F

echo All specified applications have been closed.
exit