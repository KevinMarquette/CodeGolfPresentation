# for statment: for (init; condition; increment)
for( $index=0; $index -ne 5; $index++ ) {
    Write-Host "Loop: $index"
}



# Strange syntax
for( 
    $index=0; 
    $index -ne 5; 
    $index++ 
) {
    Write-Host "Loop: $index"
}


# Value after the loop
for( $index=0; $index -ne 5; $index++ ) {
    Write-Host "Loop: $index"
}
Write-Host "After: $index"


# Order of Operation
for( 
    $index=0; # 0
    $index -ne 5; # 1
    $index++ # 3
) {
    Write-Host "Loop: $index" # 2
}

<#
10  $index=0
20  if not ($index -ne 5) goto 60
30  Write-Host "Loop: $index"
40  $index++
50  goto 20
60  Write-Host "After: $index"
70  exit
#>

# Show Execution Order
for( 
    $(Write-Host "10 Init"; $index=0); 
    $(Write-Host "20 Condition"; $index -ne 1); 
    $(Write-Host "40 Increase"; $index++) 
) {
    Write-Host "30 Loop: $index"
}
Write-Host "60 After: $index"



# 121: prime number example (exit condition)
#...
    for ($divisor = 2; $divisor -lt $number; $divisor++) {
        if ($number % $divisor -eq 0) {
            continue outer
        }
    }


# 101: move if statement into condition and invert it
#...
    for ($divisor = 2; $number % $divisor -ne 0; $divisor++) {}
    if($number -ne $divisor) {continue outer}


# return to: code challenges/prime_numbers.ps1

