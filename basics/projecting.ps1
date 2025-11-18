# Projecting: Select-Object / select
# Projecting an enumeration allows you to extract specific members of each object, to extract all the details, or to
# compute values for each object
# Synonyms:
# Select-Object
# SELECT

# $names = @("Alex","Alemu","Kebede","Dereje","Demis","ohannes");

# $result = $names | Group-Object; 
# Write-Host $result;

$directory = dir "C:\Users\demis";
$result = $directory | Group-Object Name, FullName, Attributes;
# $result = $directory | group Name, FullName, Attributes;

Write-Output $result;

$response = cd | select -First 1 *;
Write-Output $response;