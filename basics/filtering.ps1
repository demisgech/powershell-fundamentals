
# Basic Set Operations
# A set is a collection of items which can be anything. Whatever operator we need to work on these sets are in short
# the set operators and the operation is also known as set operation. Basic set operation includes Union, Intersection
# as well as addition, subtraction, etc.
# Filtering: Where-Object/Where/?

$names = @("Alber","Alex","John","Joey","Kebede","Dereje");

$result = $names | Where-Object { $_ -like "J*" };
$result = $names | Where-Object { $_ -ilike "J*" };
$result = $names | where { $_ -ilike "D*" }; # where alias for Where-Object
$result = $names | ? { $_ -ilike "A*" }; # ? alias for Where-Object
Write-Host $result;