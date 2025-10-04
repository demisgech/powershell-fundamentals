# Data Types

# String
$username = "@john";
$letters = 'ABCD...'

# Integer
$a = 10
$b = 0

# Decimal
$rating = 4.55
$PI = 3.14

# Boolean

$isMale = $true;
$completed = $false;

# Arrays
$numbers = 1,2,3,4
$numbers = @(1,2,3,4)
Write-Host $numbers;
$names = "Joe","John","Smith";

# Hashtable

$user = @{
    id = 1;
    name = "John";
};

Write-Output $user;


# Adding arrays

$first = 1,2,3,4;
$second = 5,6,7;
$combined = $first + $second;

Write-Host $combined;
             
# Output: 1 2 3 4 5 6 7