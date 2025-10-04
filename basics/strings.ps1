# String statements

# Multi-line String

$message = "Hello`r`nWorld"
$message = "Hello{0}World{0}Welcome To{0}Powershell Programming" -f [System.Environment]::NewLine
# $message = "Hello
# World"

# Write-Host $message

# Here-String
# Here-strings are very useful when creating multiline strings. One of the biggest benefits compared to other
# multiline strings are that you can use quotes without having to escape them using a backtick.

[string] $message = @"
Multiline String
Goes Here.
"@

[string] $message = @'
Test Email
Hi, gus this is 
test email for
our company.
Thanks
'@

# Here-strings begin with @" and a linebreak and end with "@ on its own line ("@must be first characters on the line,
# not even whitespace/tab).

[string] $message = @"
Simple
    Multiline String
with "quotes"
"@


[string] $message = @"
The following line won't be explained
$(Get-Date -Format "dddd")
because it is literal here-string
"@

$name = "Johannes"
$age = 21

$message = @"
Hi, $name!
How are you doing
Your are $($age + 1) years old
"@

# Rule of thumb:

# Use @" "@ if you want variables and expressions evaluated.
# Use @' '@ if you want a raw literal (no evaluation).

# Concatenating strings 
[string] $first = "Power"
[string] $second = "Shell"
$message = "Greetings from $first$second"

[string] $first = "Greetings from"
[string] $second = "Power"
[string] $third = "Shell"
$message = $first + " " + $second + "" + $third
# Sub-expressions

$message = "Tomorrow is $((Get-Date ).AddDays(1).DayOfWeek)"

# Special Characters
# When used inside a double-quoted string, the escape character (backtick `) represents a special character.
# `0 #Null
# `a #Alert/Beep
# `b #Backspace
# `f #Form feed (used for printer output)
# `n #New line
# `r #Carriage return
# `t #Horizontal tab
# `v #Vertical tab (used for printer output)
[string] $message = @"
`a
"@

# You can also escape special characters with special meanings:
# `# #Comment-operator
# `$ #Variable operator
# `` #Escape character
# `' #Single quote
# `" #Double quote

# Formatting strings

$hash = @{ city = "Addis Ababa" }
$message = "Hey, you should visit {0}" -f $hash.city

Write-Host $message
