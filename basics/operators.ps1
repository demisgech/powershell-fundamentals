# Operators

# An operator is a character that represents an action. It tells the compiler/interpreter to perform specific
# mathematical, relational or logical operation and produce final result. PowerShell interprets in a specific way and
# categorizes accordingly like arithmetic operators perform operations primarily on numbers, but they also affect
# strings and other data types. Along with the basic operators, PowerShell has a number of operators that save time
# and coding effort (eg: -like, -match, -replace, etc).

# Comparison Operators
# PowerShell comparison operators are comprised of a leading dash (-) followed by a name (eq for equal, gt for
# greater than, etc...).
# i # Case-Insensitive Explicit (-ieq)
# c # Case-Sensitive Explicit (-ceq)

# Simple Comparison Operators

$a = 10
$b = 20

$result = $a -gt $b; # (>) # Greater Than
$result = $a -ge $b; # (>=) # Greater Than or equal to
$result = $a -lt $b; # (<) Less Than or Equal to
$result = $a -le $b; # (<=) Less Than or Equal to
$result = $a -eq $b; # (==) Equal to
$result = $a -ne $b; # (!=) Not equal to

$result = "ab" -ieq "AB"; # True
$result = "ab" -ceq "AB"; # False
$result = "ab" -cgt "AB";
$result = "ab" -igt "AB";
$result = "ab" -ige "AB";
# Write-Host "Result: $result";

# String Comparison Operators

$result = "MyString" -like "*String"; # True
$result = "MyString" -ilike "*String"; # True
$result = "MyString" -clike "*String"; # True
$result = "MyString" -notlike "Other*"; # True
$result = "MyString" -inotlike "Other*"; # True
$result = "MyString" -cnotlike "Other*"; # True
$result = "MyString" -match "^My"; # True
$result = "MyString" -imatch "^My"; # True
$result = "MyString" -cmatch "^My"; # True
$result = "MyString" -notmatch "^My$"; # True
$result = "MyString" -inotmatch "^My$"; # True
$result = "MyString" -cnotmatch "^My$"; # True
# Write-Host $result;

# Collections Comparison Operators

$result = "def","oth" -contains "def"; # True
$result = "def","oth" -ccontains "Def"; # False
$result = "def","oth" -icontains "Def"; # True
$result = "def","oth" -notcontains "one"; # True
$result = "def","oth" -cnotcontains "OTH"; # True
$result = "def","oth" -cnotcontains "oth"; # False
$result = "def","oth" -inotcontains "oth"; # False
$result = "oth" -in "def","oth"; # True
$result = "oth" -iin "def","OTH"; # True
$result = "oth" -cin "def","OTH"; # False
$result = "oth" -notin "def","OTH"; # False
$result = "oth" -inotin "def","OTH"; # False
# Write-Host $result

# Arithmetic Operators

$result = 1 + 2; # Addition
$result = 1 - 3; # Subtraction
$result = -2; # Set negation
$result = 2 * 3; # Multiplication
$result = 2 / 3; # Division
$result = 2 % 3; # Modulus

$a = 2;
$b = $a++;
$b = ++$a;
$c = $a--;
$c = ++$a;

# Assignment Operators

$a = 10;
$a += 2
$a -= 2
$a *= 2
$a /= 2
$a %= 2

# Redirection Operators

# Success output stream
# cmdlet > file; # Send success output to file, overwrite existing content
# cmdlet >> file; # Send success output to file, append to existing content
# cmdlet 1>&2 # Send success and error output to error stream

# cmdlet 2> file # Send error output to file, overwriting existing content
# cmdlet 2>> file # Send error output to file, appending to existing content
# cmdlet 2>&1 # Send success and error output to success output stream

# Warning output stream: (PowerShell 3.0+)
# cmdlet 3> file # Send warning output to file, overwriting existing content
# cmdlet 3>> file # Send warning output to file, appending to existing content
# cmdlet 3>&1 # Send success and warning output to success output stream

# Verbose output stream: (PowerShell 3.0+)
# cmdlet 4> file # Send verbose output to file, overwriting existing content
# cmdlet 4>> file # Send verbose output to file, appending to existing content
# cmdlet 4>&1 # Send success and verbose output to success output stream

# Debug output stream: (PowerShell 3.0+)
# cmdlet 5> file # Send debug output to file, overwriting existing content
# cmdlet 5>> file # Send debug output to file, appending to existing content
# cmdlet 5>&1 # Send success and debug output to success output stream

# Information output stream: (PowerShell 5.0+)
# cmdlet 6> file # Send information output to file, overwriting existing content
# cmdlet 6>> file # Send information output to file, appending to existing content
# cmdlet 6>&1 # Send success and information output to success output stream

# All output streams:
# cmdlet *> file # Send all output streams to file, overwriting existing content
# cmdlet *>> file # Send all output streams to file, appending to existing content
# cmdlet *>&1 # Send all output streams to success output stream

# Differences to the pipe operator (|)
# Redirection operators only redirect streams to files or streams to streams. 
# The pipe operator pumps an object down the pipeline to a cmdlet or the output. How the pipeline works differs in general from how redirection works
# and can be read on Working with the PowerShell pipeline

# Left operand dialects
# For addition

$result = "4" + 2; # 42
$result = 2 + "4"; # 6
$result = 1,2,3 + "Hello"; # 1,2,3,Hello
$result = "Hello" + 1,2,3; # Hello1 2 3
$result = # For Multiplication
$result = 
$result = "3" * 2; # 33
$result = 2 * "3"; # 6
$result = 1,2,3 * 2; # 1,2,3,1,2,3
# $result = 2 * 1,2,3; # Gives an error op_Multiplication missing

# Logical Operators

$a = 10;
$b = 10;
# Logical AND
$result = ($a -gt 10) -and ($b -lt 12); # False

# Logical OR
$result = ($a -gt 10) -or ($b -lt 12); # True

# Logical XOR
$result = ($a -gt 10) -xor ($b -lt 12); # True

$isApproved = $true;
# Logical NOT
$result = -not $isApproved;
$result = ! $isApproved;
# Write-Host $result;

# String Manipulation Operators
# Replace Operator
$result = "The rain in seattle" -replace "rain","hail";
$result = "demisgech@domain.com" -replace "^[\w]+@(.+)",'$1';
# Write-Host $result;

# Split and join Operators

$result = "First.Second.Third" -split ".";
$result = "First","Second","Third" -join ":";
# Write-Host "Result: $result";

# Special Operators

# Array Expression Operators
$result = @(Get-ChildItem $env:windir\System32\ntdll.dll); # array of one element
$result = @(Get-ChildItem $env:windir\System32); # array of all directories and files
# Write-Host $result;

# Call Operation
$command = 'Get-ChildItem';
& $command;

# Dot sourcing operator
# ./basics/operators.ps1