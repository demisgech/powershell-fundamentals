# Switch and case statement

# A switch statement allows a variable to be tested for equality against a list of values. Each value is called a case, and
# the variable being switched on is checked for each switch case. It enables you to write a script that can choose from
# a series of options, but without requiring you to write a long series of if statements.

$condition = "First Condition"

switch ($condition) {
    "First Condition" { "First Condition Matched" }
    "Second Condition" { "Second Condition Matched" }
    Default { "Default if all the condition doesn't matched" }
}

# With CaseSensitive Parameter
# The -CaseSensitive parameter enforces switch statements to perform exact, case-sensitive matching against
# conditions.

$x = "Value"
switch -CaseSensitive ($x) {
    "Value" { "Value matched" }
    Default { "Value doesn't matched" }
}

# With Wildcard Parameter
# The -Wildcard parameter allows switch statements to perform wildcard matching against conditions.


switch -Wildcard ("Condition") {
    "Condition" { "Normal" }
    "Con*" { "One or more chars" }
    "C[aoc]ndit[f-l]on" { "Range and set's of chars" }
    "C?ndition" { "Single char wildcard" }
    "Test*" { "Not matched" }
    Default { "Condition doesn't matched" }
}

# With File Parameter
# The -file parameter allows the switch statement to receive input from a file. 
# Each line of the file is evaluated by the switch statement.

switch -file ./basics/input.txt {
    "First Condition" { "First Condition matched" }
    "Second Condition" { "Second Condition matched" }
    Default { "Condition doesn't matched" }
}

# Short exercise

Write-Host "Short exercise"
switch -CaseSensitive -Wildcard -file ./basics/input.txt {
    "First Condi*" { "First file condition matched" }
    "Second C[aoc]ndit[f-l]on" { "Second file condition matched" }
    Default { "Condition doesn't matched" }
}

# The Default keyword is used to execute an action when no other conditions match the input value.

# With Regex Parameter

switch -Regex ("Condition") {
    "Cond\D+ion" { "One or more non-digits" }
    "Conditio*$" { "Zero or more 'o'" }
    "C.ndition" { "Any Single Chars" }
    "^C\w+ion$" { "Anchors and one or more word chars" }
    "Test" { "No match" }
    Default { "Condition doesn't matched" }
}

# With break Statement

switch ("Condition") {
    "Condition" { 
        "Condition Matched"
        break
    }
    "Another Condition" {
        "Another Condition Matched"
        break
    }
    Default {
        "Condition doesn't matched"
    }
}

# With Exact Parameter

switch -Exact ("Condition") {
    "condition" { "First Action" }
    "Condition" { "Second Action" }
    "conditioN" { "Third Action" }
    "^*ondition" { "Fourth Action" }
    "Cond*" { "Another Action" }
    Default { "Default Action" }
}

# With Expressions

switch (10) {
    (5 + 5) { "First Match" }
    (2 + 8) { "Second Match" }
    (12 - 2) { "Third Match" }
    (5 * 2) { "Fourth Match" }
    { $_ -gt 5 -and $_ -lt 12 } { "Boolean Expression" }
    Default { "Default match" }
}
