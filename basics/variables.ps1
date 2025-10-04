# Variables
# Simple variables
$varName = "VariableValue";
Write-Output $varName;
$a = 10
$b = 10.11

# arrays
$arrayOfIntegers = 1,2,3,4
Write-Output $arrayOfIntegers;

$arraysOfString = "a","b","c"

$foo = "Foo";

# Remove Variables
Remove-Item Variable:\foo;

Write-Host "Foo: $foo";

$bar = "Bar"

Remove-Variable -Name bar;
# rv -Name bar; Alias for Remove-Variable
Write-Host "Bar: $bar";