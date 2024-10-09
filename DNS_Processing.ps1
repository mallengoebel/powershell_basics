$ips = @( "ip1", "ip2", "ip3", "ip4" )
foreach ( $ip in $ips ) {
	$result = nslookup $ip
	$name = ( $result | Select-String "Name:").Line -replace "Name:\s+", "" -replace "\.jbhunt\.com$", ""
	get-adcomputer $name
	}
	