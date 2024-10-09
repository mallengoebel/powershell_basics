# Basic opening to scripts for general parameter setting and preflight checks. 

# Accept a string at command call to populate a variable
param ( 
	[string]$server 
)
# Basic Preflight Checks

# Check for populated variable
if ( -not $server ) {
	# Prompt to populate if empty
	$server = Read-Host "Please enter the server name"
}
# Check if the variable is not either string.  
if ( $server -ne "string1" -and $server -ne "string2" ) {
    Write-Host "$Server is not the expected or acceptable target for this script."
	Write-Host "Please check the name and attempt again. Exiting. . . ."
	Exit 1
}
# Test connection check
if ( Test-Connection -ComputerName $server -Count 1 -Quiet ) {
	# Do all the things 
	Write-Host "Doing Stuff"
	} else {
	Write-Host "Failed to Connect. Exiting"
	Exit 1
}