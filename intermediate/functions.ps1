# Functions

function Get-Greeting {
    "Hello world"
}

# Invoking(calling) function
$greeting = Get-Greeting

Write-Host $greeting

# A function can be defined with parameters using the param block.

function Get-Message {
    param(
        [string] $content
    )

    return $content
}

$message = Get-Message -content "Message Content"
Write-Host $message

function WriteGreeting {
    param (
        [Parameter(Mandatory, Position = 0)][string] $name,
        [Parameter(Mandatory, Position = 1)][int] $age
    )
    "Hello, $name your are $age years old"
}

# Named Parameter
$greeting = WriteGreeting -age 23 -name "John"
$greeting = WriteGreeting -name "John" -age 22
# $greeting = WriteGreeting  20 "John" # Type Error
# Write-Host $greeting

# Simple Function Syntax (SFS)

function GetSum([Parameter(Mandatory)][double] $a, 
    [Parameter(Mandatory)][double] $b) {
    return $a + $b
}

$sum = GetSum -a 20.11 -b 30.11
Write-Host "Sum: $sum "

function Get-TotalPrice([Parameter(Mandatory)][double[]] $prices) {
    [double] $total = 0
    foreach ($price in $prices) {
        $total += $price
    }
    return $total
}

$totalPrice = Get-TotalPrice -prices @(10.11, 10.23, 3.45, 90.90)
Write-Host "Total Price: $totalPrice"

function Get-CustomerByName(
    [Parameter(Mandatory)][System.Array] $data,
    [Parameter(Mandatory)][string] $name) {
    $customers = @()
    foreach ($customer in $data) {
        if ( $customer.name -eq $name) {
            $customers += $customer
        }
    }
    return $customers
}

$customers = @(
    @{
        id   = 1
        name = "Demis"
    },
    @{
        id   = 1
        name = "John"
    }
)

$result = Get-CustomerByName -data $customers -name "Demis"
# Write-Output $result

function Get-CustomersByPoints(
    [Parameter(Mandatory)][System.Array] $data,
    [Parameter(Mandatory)][int] $points = 0
) {
    $customers = @()
    foreach ($customer in $data) {
        if ($customer.points -ge $points) {
            $customers += $customer
        }
    }
    return $customers
}

$customers = @(
    @{
        id     = 1
        name   = "Demis"
        points = 10
    },
    @{
        id     = 2
        name   = "John"
        points = 5
    }
    @{
        id     = 3
        name   = "Dereje"
        points = 15
    }
)

$data = Get-CustomersByPoints -data $customers -points 10
Write-Output $data

function CalculateTax {
    param (
        [Parameter(Mandatory)][double]$income,
        [double]$taxRate = 0.2
    )
    return $income * $taxRate
}

$tax = CalculateTax -income 1000 -taxRate 0.15
Write-Output "Tax: $.$tax"