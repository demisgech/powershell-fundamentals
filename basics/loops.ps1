# Loops

# For loop
# for($initial; $condition; $increment){
#  Code to be executed goes here...
# }

for ($i = 0; $i -lt 5; $i++) {
    Write-Host "$i ";
}

$prices = @(10.11,20.22,30.34,45.45);
$sum = 0;
for ($i = 0; $i -lt $prices.Count; $i++) {
    $sum += $prices[$i];
}

Write-Host "Sum: $sum";

# ForEach Loop
# ForEach has two different meanings in PowerShell. 
# One is a keyword and the other is an alias for the ForEach-Object cmdlet.

$names = @("Alex","John","Dereje","Haile");

foreach($name in $names) {
    Write-Host $name;
}

# Getting the output of foreach loop
$numbers = foreach ($number in  1..10) {
    $number
}

# Write-Host $numbers;

# Or we can do the following

$numbers = @();

foreach($number in 1..15){
    $numbers += $number
}

Write-Host $numbers;

# The ForEach() method

$squares = (1..10).ForEach({$_ * $_});
Write-Host $squares

# ForEach-Object
# $object | ForEach-Object {
#    Code-block
# }
# ForEach-Object Takes input from the pipeline

$names | ForEach-Object {
    Write-Host $_;
}

$sum = 0;
$prices | ForEach-Object {
    $sum += $_;
}

Write-Host "Total Price: $sum Birr";

# Foreach-Object has two default aliases, foreach and % (shorthand syntax). 
# Most common is % because foreach can be confused with the foreach statement

$letters = @("A","B","C","D");

$letters | ForEach-Object {
    Write-Host $_;
}

# Another way

$letters | % {
    Write-Host $_;
}
# The is another way too.

$letters | foreach {
    Write-Host "$_"
}

"A","B","C","D" | ForEach-Object -Begin {
    # Initializing processes like Opening db connection,web ...
    $results = @();
} -Process {
    # Running the processes iteratively
    # Create and store message
    $results += "Hi, my name is $_";
} -End {
    # Closing processes like db connection, network connections
    # Count messages and output them
    Write-Host "Letter Count: $( $results.Count )"
    $results
}

# While Loop

Write-Host "While Loop";
$i = 1;
while ($i -le 5) {
    Write-Host $i;
    $i += 1;
}

# do...until
Write-Host "do...until";
$i = 1;
do {
    Write-Host $i;
    $i += 1;
} until ($i -eq 5);

# do...while

Write-Host "do...while";
$i = 1;
do {
    Write-Host $i;
    $i += 1;
} while ($i -lt 5);


# Do...until

Write-Host "Do...until loop"
$i = 1
do {
    Write-Host $i
    $i += 1
} until (
    $i -gt 5
)
# NB: do...while and do...until loops are antonymous(work oppositely)
# Do-While and Do-Until are antonymous loops. If the code inside the same, the condition will be reversed.