# For Loops and a counter variable

# Set Array(s) to Loop Through
$array1 = @( "item1", "item2", "item3")
$array2 = @( "jay", "silent-bob" )
$counter = 1
#Loop Through Array1 and write a message
foreach ( $item in $array1 ) {
	Write-Host "I found $item."
	}
	Write-Host ""
# Loop Through array2 every time you loop through array1
foreach ( $item in $array1 ) {
	Write-Host "Working with $item"
	Write-Host ""
	foreach ( $name in $array2 ) { 
	Write-Host "$name is rounding the bases $counter times."
	Write-Host ""
	$counter++
	}
}	
Write-Host "Finished Loops"