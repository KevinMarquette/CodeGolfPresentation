
# Fizz Buzz
<#
Print the numbers from 1 to 100 inclusive, 
each on their own line.

If the number is a multiple of 3 then print Fizz instead
If the number is a multiple of 5 then print Buzz instead

If multiple conditions hold true then 
all replacements should be printed, 
for example 15 should print FizzBuzz. 

 1: 1
 2: 2
 3: Fizz
 4: 4
 5: Buzz
 6: Fizz
 7: 7
 8: 8
 9: Fizz
10: Buzz
11: 11
12: Fizz
13: 13
14: 14
15: FizzBuzz
...
#>

# modulos (%) operator
0 % 2  #-> 0
1 % 2  #-> 1
2 % 2  #-> 0
3 % 2  #-> 1
4 % 2  #-> 0

$num % 2 -eq 0 # is even



# 301 First pass
foreach($num in 1..100){
    if($num % 3 -eq 0 -and $num % 5 -eq 0){
        $result = "FizzBuzz"
    }
    elseif($num % 3 -eq 0){
        $result = "Fizz"
    }
    elseif($num % 5 -eq 0){
        $result = "Buzz"
    }
    else{
        $result = $num
    }
    Write-Output $result
}



#245 Remove duplicate checks
foreach($num in 1..100){
    $result = ""
    if($num % 3 -eq 0){
        $result += "Fizz"
    }
    if($num % 5 -eq 0){
        $result += "Buzz"
    }
    if($result -eq ""){
        $result = $num
    }
    Write-Output $result
}

#138 Variable names and compress the lines
foreach($n in 1..100){
    $r=""
    if($n % 3 -eq 0){$r+="Fizz"}
    if($n % 5 -eq 0){$r+="Buzz"}
    if($r -eq ""){$r=$n}
    $r
}


# Iterating Numbers
#25
foreach($n in 1..100){$n}


#pipeline
1..100 | ForEach-Object {$_}

#12 Use alias and remove whitespace
1..100|%{$_}



#125 Replace foreach(item in list)
1..100|%{
    $r=""
    if($_ % 3 -eq 0){$r+="Fizz"}
    if($_ % 5 -eq 0){$r+="Buzz"}
    if($r -eq ""){$r=$_}
    $r
}


# if conditions

#28
if($_ % 3 -eq 0){$r+="Fizz"}

$r+=if($_ % 3 -eq 0){"Fizz"}



# Ternary = (condition) ? true : false
# ? and : can be valid parts of variable names
($a -eq $b) ? $true : $false


$num % 3 -eq 0 ? "Fizz" : ""


# Flip the condition
$num % 3 -ne 0 ? "" : "Fizz"
$num % 3 ? "" : "Fizz"
1 ? "" : "Fizz"  #-> ""
0 ? "" : "Fizz"  #-> "Fizz"



# old school ternary
@($false,$true)[$a -eq $b]
@($false,$true)[0]  #-> $false
@($false,$true)[1]  #-> $true


# If false
@("Fizz",$null)[$num % 3]

@("Fizz")[$num%3]

@("Fizz")[0]    #-> "Fizz"
@("Fizz")[1]    #-> $null
@("Fizz")[2]    #-> $null


# Must be an arrary or doesn't work
"Fizz"[0]       #-> "F"
"Fizz"[1]       #-> "i"
("Fizz")[0]     #-> "F"
("Fizz")[1]     #-> "i"


# Back to FizzBuzz
1..100|%{
    $r=""
    if($_ % 3 -eq 0){$r+="Fizz"}
    if($_ % 5 -eq 0){$r+="Buzz"}
    if($r -eq ""){$r=$_}
    $r
}

# 107 Replace if statements
1..100|%{
    $r=""
    $r+=@("Fizz")[$_%3]
    $r+=@("Buzz")[$_%5]
    if($r -eq ""){$r=$_}
    $r
}

# number condition
$r="";$num = 4
# 24
if($r -eq ""){$r=$num}
$r


# with ternary
$r -eq "" ? $num : $r

# Flip operator
$r ? $r : $num

$r="";     $r ? $r : $num
$r="Fizz"; $r ? $r : $num

# 10
$r ?$r :$num




# old ternary (w/ forced bool)
@($num,$r)[[bool]$r]
[bool]""      #-> $false -> index 0
[bool]"Fizz"  #-> $true  -> index 1

# not hack
# 13
@($r,$num)[!$r]
!""           #-> $true  -> index 1
!"Fizz"       #-> $false -> index 0




# 89 w/ ternary
1..100|%{
    $r=""
    $r+=@("Fizz")[$_%3]
    $r+=@("Buzz")[$_%5]
    $r ?$r :$_
}



# 68 inline fizz buzz
1..100|%{
    $r=@("Fizz")[$_%3]+@("Buzz")[$_%5]
    $r ?$r :$_
}


# assign and use value inline
($a=5)+$a  #-> 10
($a=5*2) ? $a : "Zero"  #-> 10
($a=5*0) ? $a : "Zero"  #-> "Zero"


# 61 inline the use of $r
1..100|%{
    ($r=@("Fizz")[$_%3]+@("Buzz")[$_%5])?$r :$_
}


#53 one liner
1..100|%{($r=@("Fizz")[$_%3]+@("Buzz")[$_%5])?$r :$_}


# Is that the best we can do?

#15
@("Fizz")[$_%3]


# String multiplication
"Fizz" * 1  #-> "Fizz"
"Fizz" * 0  #-> [String]::Empty

#14
"Fizz"*!($_%3)

#51 use string multiplication
1..100|%{($r="Fizz"*!($_%3)+"Buzz"*!($_%5))?$r :$_}




# PS 7 Null Coalescing Operator

if($null -eq $value){
    $value = "default"
}

# Null Coalescing Assignment
$value ??= "default"

# Null Coalescing Operator
$result = $value ?? "default"

$null ?? "isNull"   #-> "isNull"
"Fizz" ?? "isNull"  #-> "Fizz"


# but must be null
$null ?? "isNull"   #-> "isNull"
$true ?? "isNull"   #-> $true
$false ?? "isNull"  #-> $false
1 ?? "isNull"       #-> 1
0 ?? "isNull"       #-> 0
"" ?? "isNull"      #-> ""


# vs ternary
$r ?$r :$_
$r ??$_


#53 one liner
1..100|%{($r=@("Fizz")[$_%3]+@("Buzz")[$_%5])?$r :$_}
#45 null coalescing
1..100|%{@("Fizz")[$_%3]+@("Buzz")[$_%5]??$_}



# Nicolas Baudin
# @NicolasBn44


# scriptblock as string
@("Fizz")[0]    #-> "Fizz"
@("Fizz")[1]    #-> $null

{Fizz}[0]       #-> "Fizz"
{Fizz}[1]       #-> $null


# one problem, can't add together
{Fizz} + {Buzz}  #-> InvalidOperation: does not contain a method named 'op_Addition'.

# but remember left to right casting order
"Fizz" + {Buzz}  #-> "FizzBuzz"

#42 scriptblock as string
1..100|%{@("Fizz",)[$_%3]+{Buzz}[$_%5]??$_}