# This is a basic logging function to be added to a Powershell script that wants logging 
# for debugging, audit, or reporting purposes. To use this script properly, define the log 
# name and path. Test for path and create as needed. The testing section should be replaced 
# by the body of the script this is going into to capture logs. Then rotate and collect the 
#garbage with the final stanza. 

# Define the log directory and the log file name
# Set Logging Path
$logDirectory = "C:\path\to\logs\"
$logFileName = "logname_{0}.log" -f (Get-Date -Format "yyyyMMddhhmmss")
# Create the log directory if it doesn't exist
if (-not (Test-Path -Path $logDirectory)) {
    New-Item -ItemType Directory -Path $logDirectory
}
# Define the full path to the log file
$logFilePath = Join-Path -Path $logDirectory -ChildPath $logFileName

#*#*#*#*#*#*#*#*#*#*#*#*#* Testing Section For Removal when pressed into service *#*#*#*#*#*#*#*#*#*#*#*#*#*#
# Write a log entry
$logEntry = "{0} - This is a log entry." -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
Add-Content -Path $logFilePath -Value $logEntry
#*#*#*#*#*#*#*#*#*#*#*#*#* Testing Section For Removal when pressed into service *#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Rotate logs: Keep only the last 7 log files
$files = Get-ChildItem -Path $logDirectory -Filter "wac-delegation_*.log" | Sort-Object LastWriteTime -Descending
$filesToKeep = $files | Select-Object -First 7
$filesToDelete = $files | Where-Object { $_ -notin $filesToKeep }
foreach ($file in $filesToDelete) {
    Remove-Item -Path $file.FullName -Force
}
#*#*#*#*#*#*#*#*#*#*#*#*#* Optionally Keep 'N' Days of logs  *#*#*#*#*#*#*#*#*#*#*#*#*#*#
# Uncomment below lines for use. 
## Rotate logs: Keep only the last 7 days of logs
#$files = Get-ChildItem -Path $logDirectory -Filter "wac-delegation_*.log"
#$filesToDelete = $files | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) }
#foreach ($file in $filesToDelete) {
#    Remove-Item -Path $file.FullName -Force
#}
