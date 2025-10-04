# Grouping: Group-Object / group

$names = @("Alex","Alemu","Dereje","Johannes","Kebede");

$result = $names | Group-Object -Property Length
$result = $names | group -Property Length
Write-Host $result;

foreach ( $res in $result) {
    Write-Host $res;
}