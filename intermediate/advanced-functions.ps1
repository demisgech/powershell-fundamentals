function Verb-Noun {
    [CmdletBinding(
        DefaultParameterSetName = "Parameter Set 1",
        SupportsShouldProcess = $true,
        HelpUri = "https://localhost.com",
        PositionalBinding = $false,
        ConfirmImpact = "Medium"
    )][Alias()] [OutputType([string])]
    param (
        # Param1 help description
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $false,
            ValueFromRemainingArguments = $false,
            Position = 0,
            ParameterSetName = "Parameter Set 1",
            HelpMessage = "Help Message goes here")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        # [ValidateCount(0, 5)]
        [ValidateSet('sun', 'moon', 'earth')]
        [Alias("p1")] $param1,
        # Param2 help description
        [Parameter(ParameterSetName = "Another Parameter Set Name")]
        [AllowNull()]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [ValidateScript({ $true })]
        [ValidateRange(0, 15)]
        [Int] $param2,
        # Param3 help description
        [Parameter(ParameterSetName = "Another Parameter Set")]
        [ValidatePattern("[a-z]*")]
        [ValidateLength(0, 15)]
        [String] $param3
    )
    
    begin {
        # Start:
        # Database connection
        # Network connection
        # Open files and so on
        Write-Host "Beginning..."
    }
    
    process {
        # Process them
        Write-Host "Processing..."
        Write-Host $PSCmdlet.ShouldProcess("Target", "Operation")
    }
    
    end {
        # Close connections,files and so on
        Write-Host "Ending..."
    }
}

$result = Verb-Noun 
# $result = Verb-Noun -param1 "moon" -param2 $null -param3 ""
$result

# Mandatory Parameter

function Get-Greeting {
    param (
        [Parameter(Mandatory)]
        [String] $name
    )
    Write-Output "Hello,$name"
}

# Get-Greeting -name "John"
# Get-Greeting 

# Validating Parameters

#Option: #1 ValidateSet
# Sometimes we need to restrict the possible values that a parameter can accept. Say we want to allow only red,
# green and blue for the $Color parameter in a script or function.
# We can use the ValidateSet parameter attribute to restrict this. It has the additional benefit of allowing tab
# completion when setting this argument (in some environments).
# You can also specify IgnoreCase to disable case sensitivity.

function Validate-ParameterSet {
    param (
        [ValidateSet("red", "green", "blue", IgnoreCase)]
        [String]
        $color
    )
}

# Option: #2 ValidateRange
# This method of parameter validation takes a min and max Int32 value, and requires the parameter to be within that
# range.

function Validate-ParameterRange {
    param(
        [ValidateRange(0, 120)]
        [Int]$age
    )
}

# Option: #3 ValidatePattern
# This method of parameter validation accepts parameters that match the regex pattern specified.

function Validate-ParameterPattern {
    param (
        [ValidatePattern("[a-z]*")]
        [String]$name
    )
}

# Option: #4 ValidateLength
# This method of parameter validation tests the length of the passed string.

function Validate-ParameterLength {
    param(
        [ValidateLength(0, 15)]
        [String]$phoneNumber
    )
}

# Option: #5 ValidateCount
# This method of parameter validation tests the amount of arguments passed in, for example, an array of strings.

function Validate-ParameterCount {
    param (
        [ValidateCount(0, 5)]
        [String[]] $ComputerNames
    )
}

# Option: #6 ValidateScript
# Finally, the ValidateScript method is extraordinarily flexible, taking a scriptblock and evaluating it using $_ to
# represent the passed argument. It then passes the argument if the result is $true (including any output as valid).
# This can be used to test that a file exists:


function Validate-ParameterScript {
    param(
        [ValidateScript({ Test-Path $_ })]
        [System.IO.FileInfo]$path
    )
}

# To Check that a user exists in Active Directory

function Check-UserInActiveDirectory {
    param(
        [ValidateScript({ Get-ADUser $_ })]
        [String]$username
    )
}

function Validate-TimeAboutAnHourAgo {
    param(
        [ValidateScript({
                $anHourAgo = (Get-Date).AddHours(-1)
                if ($_ -lt $anHourAgo.AddMinutes(5) -and $_ -gt $anHourAgo.AddMinutes(-5)) {
                    $true
                }
                else {
                    throw "That is not within 5 minutes. Try again"
                }
            })]
        [String]$timeAboutAnHourAge
    )
}