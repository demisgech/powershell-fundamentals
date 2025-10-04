# Hash Tables
# A Hash Table is a structure which maps keys to values

$hashtable = @{
    key1 = "Value1"
    key2 = "Value2"
}

Write-Output $hashtable

# Accessing hashtable with its key

$point = @{
    x = 0
    y = 0
}

# Write-Host "Point($($point.x,$point.y))"

$hashtable = @{
    'key 1' = "value1"
    'key 2' = "value2"
}

$hashtable.'key 1' = "Another Value"
# Write-Host $hashtable.'key 1'

$emptyHashtable = @{}
Write-Output $emptyHashtable

# If the hashtable element written in single line , you have to use semicolon to separate them
$user = @{ id = 10; name = "Yohannes" }

# Add key-value pair
$user += @{
    email = "johngech@domain.com"
}
# Or we can use the Add method
$user.Add("age", 23)
# $user.Add("age", 23) # Error Key already exist

# Remove element

$user.Remove("age")
# $user.Remove("age") # Nothing will happen
# Write-Output $user

# Enumerating through keys and key-values

Write-Host "Enumerating..."
$hashtable = @{
    key1 = "Value1"
    key2 = "Value2"
}

# foreach ($key in $hashtable.Keys) {
#     $key
# }

foreach ($key in $hashtable.Keys) {
    Write-Output "{ Key: $key, value: $($hashtable[$key]) }"
    # or
    # Write-Output "{ Key: $key, value: $($hashtable.$key) }"
}

# Enumerating through key-value pairs

Write-Host "Enumerating through key-value pairs"
foreach ($keyValuePair in $hashtable.GetEnumerator()) {
    Write-Host $keyValuePair
}
