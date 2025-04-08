<#
The Collatz conjecture states that, for any positive integer n, 
it will eventually reach 1 by repeatedly applying the following procedure:

If n is even, divide it by 2.
If n is odd, multiply by 3 and then add 1.
The number of steps needed for n to reach 1 is called its stopping time. 
For example, the stopping time of 10 is six:

10 → 5 → 16 → 8 → 4 → 2 → 1

Print the stopping times of all the numbers from 1 to 1,000 inclusive, each on their own line.
#>

# Github Copilot (279 characters)
function collatz(){
    param([int]$n)
    $steps = 0
    while($n -ne 1){
        if($n % 2 -eq 0){
            $n = $n / 2
        }else{
            $n = 3 * $n + 1
        }
        $steps++
    }
    return $steps
}
1..1000 | ForEach-Object {
    collatz $_
}



# Remove some whitespace and use short names (193 characters)
function c(){
    param([int]$n)
    $s=0
    while($n-ne1){
        if($n%2-eq0){
            $n=$n/2
        }else{
            $n=3*$n+1
        }
        $s++
    }
    $s
}
1..1000|%{c $_}


# ternary operator?
if($n%2-eq0){
    $n=$n/2
}else{
    $n=3*$n+1
}

$n=if($n%2 -eq 0){$n=$n/2}else{$n=3*$n+1}

# $n = <expression> ? <true> : <false>
$n= ($n%2 -eq 0)?($n/2):(3*$n+1)
$n=$n%2-eq0?$n/2:3*$n+1

# ternary operator (136 characters)
function c(){
    param([int]$n)
    $s=0
    while($n-ne1){
        $n=$n%2-eq0?$n/2:3*$n+1
        $s++
    }
    $s
}
1..1000|%{c $_}


# inline function (98 characters)
1..1000|%{
    $s=0
    while($_-ne1){
        $_=$_%2-eq0?$_/2:3*$_+1
        $s++
    }
    $s
}


# for loop instead of while (97 characters)
1..1000|%{
    $s=0
    for(;$_-ne1){
        $_=$_%2-eq0?$_/2:3*$_+1
        $s++
    }
    $s
}


# invert the ternary (93)
$_ = $_%2 -eq 0 ? $_/2 : 3*$_+1
$_ = $_%2 ? 3*$_+1 : $_/2


1..1000|%{
    $s=0
    for(;$_-ne1){
        $_=$_%2?3*$_+1:$_/2
        $s++
    }
    $s
}

# rework the for loop condition (91)
$_-ne1 == $false
$_-1  == 0

1..1000|%{
    $s=0
    for(;$_-1){
        $_=$_%2?3*$_+1:$_/2
        $s++
    }
    $s
}

#condense lines into for loop (78)
1..1000|%{
    for($s=0;$_-1;$s++){
        $_=$_%2?3*$_+1:$_/2
    }
    $s
}

# inline everything (53)
1..1000|%{for($s=0;$_-1;$s++){$_=$_%2?3*$_+1:$_/2}$s}



# recursive collatz (144 characters)
function c{
    param($n)
    if($n-eq1){return 0}
    if($n%2-eq0){
        return 1+(c($n/2))
    }
    return 1+(c(3*$n+1))
}
1..1000|%{c $_}


# ternary 120

function c{
    param($n)
    if($n-eq1){return 0}
    return 1 + ($n%2-eq0 ? (c($n/2)) : (c(3*$n+1)))
}
1..1000|%{c $_}

# remove returns 117
function c{
    param($n)
    if($n-eq1){0}
    else{
    1 + ($n%2-eq0 ? (c($n/2)) : (c(3*$n+1)))
}}
1..1000|%{c $_}

# replace function 116
$s={
    param($n)
    if($n-eq1){0}
    else{
    1 + ($n%2-eq0 ? (.$s($n/2)) : (.$s(3*$n+1)))
}}
1..1000|%{.$s $_}

# replace foreach scriptblock 114
$s={
    param($n=$_)
    if($n-eq1){0}
    else{
    1 + ($n%2-eq0 ? (.$s($n/2)) : (.$s(3*$n+1)))
}}
1..1000|% $s

# factor out the ternary 105
$s={
    param($n=$_)
    if($n-eq1){0}
    else{
    1 + (.$s($n%2-eq0 ? $n/2 : 3*$n+1))
}}
1..1000|% $s

# fix the ternary 97
$s={
    param($n=$_)
    if($n-eq1){0}
    else{
    1 + (.$s($n%2?3*$n+1:$n/2))
}}
1..1000|% $s

# add 2nd ternary 77
$s={
    param($n=$_)
    $n-eq1?0:(1+(.$s($n%2?3*$n+1:$n/2)))
}
1..1000|% $s

# flip 2nd ternary 75
$s={
    param($n=$_)
    $n-1?(1+(.$s($n%2?3*$n+1:$n/2))):0
}
1..1000|% $s

# remove param 60
$s={
    $_-1?(1+(($_%2?3*$_+1:$_/2)|% $s)):0
}
1..1000|% $s


# remove parentheses 58
$s={
    $_-1?1+($_%2?3*$_+1:$_/2|% $s):0
}
1..1000|% $s


# remove parentheses 56
$s={
    $_-1?1+($_%2?3*$_+1:$_/2|% $s):0
}
1..1000|% $s


# remove whitespace 50
$s={$_-1?1+($_%2?3*$_+1:$_/2|% $s):0}
1..1000|% $s


# inline scriptblock 49
1..1000|% ($s={$_-1?1+($_%2?3*$_+1:$_/2|% $s):0})


# remove a space 48
1..1000|%($s={$_-1?1+($_%2?3*$_+1:$_/2|% $s):0})

