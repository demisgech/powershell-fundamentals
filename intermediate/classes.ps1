# PowerShell Classes
# A class is an extensible program-code-template for creating objects, providing initial values for state (member
# variables) and implementations of behavior (member functions or methods).A class is a blueprint for an object. It is
# used as a model to define the structure of objects. An object contains data that we access through properties and
# that we can work on using methods. PowerShell 5.0 added the ability to create your own classes.

# Listing available constructor for classes
# In PowerShell 5.0+ you can list available constructors by calling the static new-method without parentheses.
# $datetime = [DateTime]::new
# $datetime

# This is the same technique that you can use to list overload definitions for any method
# e.g 
# 'abc'.CompareTo

# For earlier versions you can create your own function to list available constructors:

function Get-Constructors {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true)]
        [type] $type
    )
    process {
        $type.GetConstructors() | Format-Table -Wrap @{
            label      = "$($type.Name) Constructors"
            # expression = { ($_.GetParameters() | % { $_.ToString() }) -join ", " }
            expression = { ($_.GetParameters() | ForEach-Object { $_.ToString() }) -join ", " }
        }
    }
}

# NB: % is an alias for ForEach-Object

# $result = Get-Constructors -type System.DateTime
# $result

# Defining user defined class

class Person {
    [String] $firstName
    [String] $lastName

    [String] Greeting() {
        return "Greeting,{0} {1}!" -f $this.firstName, $this.lastName
    }
}

$person = [Person]::new()
$person.firstName = "Johannes"
$person.lastName = "Getachew"
$person.Greeting()

class User {
    hidden [Int] $id
    hidden [String] $name
    hidden [SecureString] $password
    
    User([Int] $id, [String] $name) {
        $this.id = $id
        $this.name = $name
        $this.password = [SecureString]::new()
    }

    User([Int] $id, [String] $name, [SecureString]$password) {
        $this.id = $id
        $this.name = $name
        $this.password = $password
    }
    
    [void] SetId([Int] $id) {
        $this.id = $id
    }

    [Int] GetId() {
        return $this.id
    }

    [Void] SetName([String] $name) {
        $this.name = $name
    }
    [String] GetName() {
        return $this.name
    }

    [Void] SetPassword([SecureString] $password) {
        $this.password = $password
    }
    [SecureString] GetPassword() {
        return $this.password
    }

    [Void] DisplayInfo() {
        Write-Host "**** User Info ****"
        Write-Host "{ id: $($this.id), name: $($this.name), password: $($this.password) }"
    }
}

$user = [User]::new(1, "Demis")
$user.DisplayInfo()
$user.GetId()

