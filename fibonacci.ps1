<#
Fibonacci

The Fibonacci numbers are a numerical sequence in which each number 
is the sum of the two preceding numbers: 0, 1, 1, 2, 3, 5, 8, 13…

Print the first 31 Fibonacci numbers from F0 = 0 to F30 = 832040 (inclusive), 
each on a separate line.

#>
#region Array
# 138: First attempt with Array
$a = 0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
for($i = 2; $i -le 30; $i++){
    $a[$i] = $a[$i - 1] + $a[$i - 2]
}
$a

# 92: Short Array
$a = 0,1 + @(0) * 29
for($i = 2; $i -le 30; $i++){
    $a[$i] = $a[$i - 1] + $a[$i - 2]
}
$a

# 77: Append array
$a = 0,1
for($i = 2; $i -le 30; $i++){
    $a += $a[$i - 1] + $a[$i - 2]
}
$a


# 69: Reverse index
$a = 0,1
for($i = 2; $i -le 30; $i++){
    $a += $a[-1] + $a[-2]
}
$a


# Lesson: iterating_numbers.ps1


# 43: drop for loop
$a = 0,1
2..30|%{
    $a += $a[-1]+$a[-2]
}
$a


# 36: remove whitespace
$a=0,1
2..30|%{$a+=$a[-1]+$a[-2]}
$a

#endregion


#region ABSwap

# 2nd Attempt with temp variable swap
$current = 0
$next = 1
0..30|%{
    $current # output value
    $temp = $next # save the next
    $next = $current + $next # calculate new next
    $current = $temp # update current for next loop
}

# 78: 2nd Attempt with temp variable swap
$a = 0
$b = 1
0..30|%{
    $a
    $temp = $b
    $b = $a + $b
    $a = $temp
}

# 54: Remove temp
$a = 0
$b = 1
0..30|%{
    $a
    $a,$b = $b,($a+$b)
}


# 52 remove $a init
$b = 1
0..30|%{
    $a ?? 0
    $a,$b = $b,($a+$b)
}


# 49: add initial 0 output
$b = 1
0
0..30|%{
    $a
    $a,$b = $b,($a+$b)
}


# 47 remove $b init
0
0..30|%{
    $a,$b = $b,($a+$b ?? 1)
    $a
}


# 44 Shift $a swap inline
0
0..30|%{
    $b = $a+($a=$b) ?? 1
    $a
}

# 44 remove $a output
0
0..30|%{
    $b
    $b = $a+($a=$b) ?? 1
}

# 39: assign and output
0
1..30|%{
    ($b = $a+($a=$b) ?? 1)
}


# 29: remove whitespace
0
1..30|%{($b=$a+($a=$b)??1)}



# 29: final
0
1..30|%{($b=$a+($a=$b)??1)}

#endregion

$a=$b=$null
0
,1*30|%{($b=$a+($a=$b)??1)}
