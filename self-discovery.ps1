$gateway = $env:COMPUTERNAME
$gatewayObject = Get-ADComputer -Identity $gateway
$DomainName = (Get-WmiObject Win32_ComputerSystem).Domain
$property = Get-ADComputer -Identity $gateway -Server $DomainName | Select-Object -ExpandProperty DistinguishedName
