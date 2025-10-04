# Ordering: Sort-Object / sort

$names = @("Alex","Alemu","Kebede","Bekele","Johannes","Dereje");

$result = $names | Sort-Object -Descending;
$result = $names | sort -Descending; # sort alias for Sort-Object
$result = $names | Sort-Object; # Ascending
$result = $names | Sort-Object { $_.Length };
Write-Host $result;