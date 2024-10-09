# Set parameters
param (
    [switch]$extpurge,
    [string]$cleandump,
	[switch]$help
)

# Usage statement
$helpContent = @"
Usage:	.\help-section.ps1 [options]

Options:
	-help			Display this help message
	-extpurge		Roll the service for External Purge on 10306
	-cleandump <value>	Clean up the spurious dump files on one of three servers


Examples:
  .\help-section.ps1 -help
  .\help-section.ps1 -extpurge
  .\help-section.ps1 -cleandump jvpb2b10306
  .\help-section.ps1 -extpurge -cleandump jvpb2b10306
 

Description:
  This is a script which is designed to be a one stop shop for easily remedied B2B cluster issues.
  The first is an external purge service roll. The second is a clean up of dump files for disk
  space issues. Other tasks can be added.
"@

# Function to roll the external purge service running on 10306
function ext-purge-roll {
    $Server = "Some-server"
    $Service = "IBM*Ext*Purge*8080"
    $marker = 1
    if ($marker -eq 1) {
        Write-Host "Parameters Set for External Purge Service Roll"
        Write-Host "Server:" $Server
        Write-Host "Service:" $Service
    }
}

# Function to remove designated dump files on one of three hosts
function cleandump {
    param (
        [string]$Server
    )
    $marker = 1
    if ($marker -eq 1) {
        Write-Host "Parameter Set for Dump File Clean Up task"
        Write-Host "Server:" $Server
    }
}

# Check if any arguments are passed and print usage statement if not
if ($help) {
    Write-Output $helpContent
    exit
}

# Call Functions
if ($extpurge) {
    ext-purge-roll
}

if ($cleandump) {
    cleandump -Server $cleandump
}