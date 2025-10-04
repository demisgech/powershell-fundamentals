# Conditional Statements

$test = "test";

if($test -eq "test") {
    Write-Host "Condition Matched.";
} else {
    Write-Host "Condition Not Matched..."
}

$isPublished = $true

if ($isPublished) {
    Write-Host "Published";
} else {
    Write-Host "Not Published";
}

# elseif

[int] $a = 100;
[int] $b = 50;
[int] $c = 300;

if ($a -ge $b -and $a -ge $c) {
    Write-Host "$a is greater";
} elseif ($b -ge $a -and $b -ge $c) {
    Write-Host "$b is greater";
} else {
    Write-Host "$c is greater";
}

# Even-Odd
[int] $number = 21

if ($number % 2 -eq 0) {
    Write-Host "$number is Even";
} else {
    Write-Host "$number is Odd";
}

$names = @("Alex","John","Alemu","Joey","Kebede","Dereje");

if("Alex" -notin $names){
    Write-Host "Name is not in the list";
}else {
    Write-Host "Yes! It is found."
}