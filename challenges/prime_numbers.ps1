<#
# Prime Numbers

Print all the prime numbers from 1 to 100 inclusive, each on their own line.
https://code.golf/prime-numbers#powershell

Prime number is a whole number greater than 1 that cannot be exactly divided by any whole number other than itself and 1:

## Prime Numbers between 1 and 100
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97

#>


<#
Article: Prime Numbers in PowerShell
Link: https://www.tunbury.org/prime-numbers-in-powershell/
Author: Mark Elvers
Twitter: @mtelvers
#>


# 479: loop over all the numbers from 2 to 100
for ($number = 2; $number -lt 100; $number++) {
    $prime = $true

    # check each value from 2 up until the square root of the number
    for ($divisor = 2; $divisor -le [Math]::Sqrt($number); $divisor++) {

        # if the number is divisible then it is not prime.
        if ($number % $divisor -eq 0) {
            $prime = $false
            break;
        }
    }

    # Output the number if it is prime
    if ($prime) {
        Write-Host -NoNewLine "$number "
    }
}



# 309: Remove comments and extra lines
for ($number = 2; $number -lt 100; $number++) {
    $prime = $true
    for ($divisor = 2; $divisor -le [Math]::Sqrt($number); $divisor++) {
        if ($number % $divisor -eq 0) {
            $prime = $false
            break;
        }
    }
    if ($prime) {
        Write-Host -NoNewLine "$number "
    }
}


# 249: Remove prime flag


:outer for ($number = 2; $number -lt 100; $number++) {
    for ($divisor = 2; $divisor -le [Math]::Sqrt($number); $divisor++) {
        if ($number % $divisor -eq 0) {
            continue outer
        }
    }
    Write-Host -NoNewLine "$number "
}



# 235: Remove sqrt optimization


:outer for ($number = 2; $number -lt 100; $number++) {
    for ($divisor = 2; $divisor -lt $number; $divisor++) {
        if ($number % $divisor -eq 0) {
            continue outer
        }
    }
    Write-Host -NoNewLine "$number "
}



# See: code statement_for.ps1



# 218: update for loop exit condition


:outer for ($number = 2; $number -lt 100; $number++) {
    for ($divisor = 2; $number % $divisor -ne 0; $divisor++) {}
    if ($number -ne $divisor) {
        continue outer
    }
    Write-Host -NoNewLine "$number "
}



# 205: remove label


for ($number = 2; $number -lt 100; $number++) {
    for ($divisor = 2; $number % $divisor -ne 0; $divisor++) {}
    if ($number -ne $divisor) {
        continue
    }
    Write-Host -NoNewLine "$number "
}


# 192: remove continue


for ($number = 2; $number -lt 100; $number++) {
    for ($divisor = 2; $number % $divisor -ne 0; $divisor++) {}
    if ($number -eq $divisor) {
        Write-Host -NoNewLine "$number "
    }
}


# 138: shorten variable names


for ($n = 2; $n -lt 100; $n++) {
    for ($d = 2; $n % $d -ne 0; $d++) {}
    if ($n -eq $d) {
        Write-Host -NoNewLine "$n "
    }
}


# 130: compress outer for loop (remove all spaces)

for($n=2;$n-lt100;$n++){
    for ($d = 2; $n % $d -ne 0; $d++) {}
    if ($n -eq $d) {
        Write-Host -NoNewLine "$n "
    }
}


# See: code iterating_numbers.ps1



# refference loop
1..5|%{$_} # 10 no spaces

# 115: ForEach-Loop
2..100|%{
    for ($d = 2; $_ % $d -ne 0; $d++) {}
    if ($_ -eq $d) {
        Write-Host -NoNewLine "$_ "
    }
}

# 76: Remove Write-Host

2..100|%{
    for ($d = 2; $_ % $d -ne 0; $d++) {}
    if ($_ -eq $d) {$_}
}

# 56: Remove whitespace

2..100|%{
 for($d=2;$_%$d-ne0;$d++){}
 if($_-eq$d){$_}
}



# 48: use Where-Object


2..100|?{
 for($d=2;$_%$d-ne0;$d++){}
 $_-eq$d
}


# 45: Move increment into condition

2..100|?{
 for($d=1;$_%++$d-ne0){}
 $_-eq$d
}


# 41: one line

2..97|?{for($d=1;$_%++$d-ne0){};$_-eq$d}




# Audience Challenge: Who spotted 2 more? (1 char and 4 char savings)



2..100|?{for($d=1;$_%++$d-ne0){};$_-eq$d}  # 41
2..97|?{for($d=1;$_%++$d-ne0){};$_-eq$d}   # 40 use 97 instead of 100
2..97|?{for($d=1;$_%++$d){};$_-eq$d}       # 36 -ne0 is redundant




# reverse the for loop, cound down to 1
# count up to $number
for ($divisor = 2; $number % $divisor -ne 0; $divisor++) {}
# count down to 1
for ($divisor = $number - 1; $number % $divisor -ne 0; $divisor--) {}



2..97|?{for($d=1;$_%++$d){};$_-eq$d}   # 36
2..97|?{for($d=$_-1;$_%$d--){};$_-ne0} # 38
2..97|?{for($d=$_-1;$_%$d--){};!$d}    # 35


# 35: final solution:
2..97|?{for($d=$_-1;$_%$d--){};!$d}

