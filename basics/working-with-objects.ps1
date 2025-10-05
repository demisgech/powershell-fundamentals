# Working with objects

# Get-Item C:\Windows | Get-Member

# $object = Get-Item C:\Windows
# $object.GetDirectories()
# $object.GetFiles()
# $object.GetType()
# $object.GetFileSystemInfos()

# Get-Item C:\Windows | Format-List -Property *

# Add new property to existing object

$object = New-Object -TypeName PSObject -Property @{
    id         = 1
    username   = $env:username
    last_login = Get-Date
}

Add-Member -InputObject $object -Name "password" -Value "Hashed Password" -MemberType NoteProperty

# Another way to add property

$newObject = $object | Select-Object *, @{ label = "email"; expression = { "demisgech@domain.com" } }
Write-Output $newObject

# Write-Host -ForegroundColor  Green "End of statement"
# Write-Host "End of statement" -ForegroundColor DarkCyan
# Write-Host "End of statement" -BackgroundColor DarkMagenta

# $newObject = $object | Select-Object *, @{ label = "email"; expression = { "demisgech@domain.com" } }
# Can be shortened like the following

$newObject = $object | select *, @{ l = "email"; ex = { "demisgech@gamil.com" } }
Write-Output $newObject

# Removing properties

$objectAfterPropertyRemoved = $newObject | Select-Object * -ExcludeProperty id, last_login
Write-Output $objectAfterPropertyRemoved

<#
    Creating a new object
    PowerShell, unlike some other scripting languages, sends objects through the pipeline. What this means is that
    when you send data from one command to another, it's essential to be able to create, modify, and collect objects.
    Creating an object is simple. Most objects you create will be custom objects in PowerShell, and the type to use for
    that is PSObject. PowerShell will also allow you to create any object you could create in .NET.
#>

# Option: #1 New-Object

$newCollection = @()

$customer = New-Object -TypeName PSObject -Property @{
    id         = 1
    name       = "John Getachew"
    email      = "john.gech@domain.com"
    last_login = Get-Date
}

Write-Output $customer

# Option: #2 Select-Object

$coder = "" | Select-Object -Property id, name, job, email
$coder.name = $env:USERNAME
$coder.id = 1
$coder.job = "DevOps Engineer"
$coder.email = "coder@domain.com"

Write-Output $coder


# Option: #3 PSCustomObject
# Option 3: pscustomobject type accelerator (PSv3+ required)
# The ordered type accelerator forces PowerShell to keep our properties in the order that we defined them. You don't
# need the ordered type accelerator to use [PSCustomObject]:

$newObject = [PSCustomObject][Ordered] @{
    id       = 1
    username = $env:USERNAME
    email    = "$($env:USERNAME)@domain.com"
}
# Add new element
$newObject = $newObject | Select-Object *, @{ 
    label      = "password" 
    expression = { "MyPassword" } 
}

Write-Host "PSCustomObject"
Write-Output $newObject