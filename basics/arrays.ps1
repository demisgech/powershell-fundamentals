# Arrays

$data = "First.Second.Third";

$parts = $data.Split(".");
$first = $parts[0]
$second = $parts[1]
$third = $parts[2]

# Write-Output "{ $first, $second, $third}";

# Unpacking(Destructuring)
$first,$second,$third = $data.Split(".");
Write-Output "{ $first, $second, $third }";

$data = "a","b","c","d"

$first, $second,$other = $data;
Write-Host $other;

$integers = @(10,20,30,40);

$names = @("Abebe","Kebede","Alemu","Johannes");
$collections = @(10,"ABC",$true,30.21,@('a','b'),@{id=1;name="John"})
Write-Host $collections;
