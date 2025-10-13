# Advanced Function
# Advanced functions are PowerShell functions that behave like cmdlets. They support CmdletBinding,
# parameter attributes, pipeline input, and structured object output.

# Syntax
function Verb-Noun {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [String] $name,
        [ValidateRange(1, 10)]
        [Int] $count = 0
    )
    
    begin {
        Write-Host "Before processing..."   
    }
    process {
        for ($i = 0; $i -lt $count; $i++) {
            [PSCustomObject]@{
                name   = $name
                number = $i
            }
        }
    }
    end {
        Write-Host "After processing..."
    }
}

# "Advanced function" | Verb-Noun -count 2

@("one", "two", "three") | Verb-Noun -count 3