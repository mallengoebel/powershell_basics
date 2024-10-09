$gateway = $env:COMPUTERNAME
$gatewayObject = Get-ADComputer -Identity $gateway
$DomainName = (Get-WmiObject Win32_ComputerSystem).Domain
$property = Get-ADComputer -Identity $gateway -Server $DomainName | Select-Object -ExpandProperty DistinguishedName

$domain = "nonprod.jbhunt.com"
$item = "jvtweb15601"
$nodeObject = (Get-ADComputer -Identity "$item" -Server $domain) 
$value = (Get-ADComputer -Identity $nodeObject -Properties * | Select-Object -ExpandProperty PrincipalsAllowedToDelegateToAccount)
if ($value -eq $property) {
	Write-Host "$nodeObject already set"
	} else {
		Set-ADComputer -Identity $nodeObject -PrincipalsAllowedToDelegateToAccount $gatewayObject
	}