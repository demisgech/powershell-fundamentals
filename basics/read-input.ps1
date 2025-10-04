# Reading Input

$a = Read-Host "Number"
Write-Host ($a -gt 10);

$username = Read-Host "Username"
$password = Read-Host "Password"

Write-Host "Username: $username, Password: $password";

# [decimal]$first = Read-Host "First"
[double]$first = Read-Host "First"
[int]$second = Read-Host "Second"

$sum = $first + $second;
Write-Host "Sum: $sum";