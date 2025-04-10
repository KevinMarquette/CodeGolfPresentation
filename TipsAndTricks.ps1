function prompt {"#PSHSummit>"};Clear-Host;return





# Output Notations
Get-Date  #-> "Tuesday, April 8, 2025 11:10:01 AM"
1 + 2     #-> 3



# 8: Numer of character
Get-Date

Get-Date  # 8: char



# Printing Output for code.golf
Write-Host 'Hello, World!'
Write-Output 'Hello, World!'

'Hello, World!'



# Accessing arguments in Code.Golf
$args|%{
    $_
}



# Unicode Characters
"😀🙂😐"


#region Whitespace
# .vscode\settings.json
# "editor.renderWhitespace":"all"
if ( $true ) {
    "Whitespace"
}

# Whitespace mostly optional
if($true){"Whitespace"}



# Math Operators
1 + 2 - 3 * 4 % 5
1+2-3*4%5

$a+$b-$c*$d%$e



# Pipeline
$array = @(1,2,3)
$array | ForEach-Object { $_ }
$array|ForEach-Object{$_}
$array|%{$_}

#  foreach scriptblock
$s = {$_}
$array|ForEach-Object $s
$array|% $s



# Comparison Operators
5 -eq 5
5-eq5

$a-eq$b


5 -eq 5 -and 5 -ne 9
5-eq5-and5-ne9
$a-eq$b-and$c-ne$d


# alternate to comparison
$a=5
$a-ne5  # -> $false
$a-5    # -> 0 ~ $false


# Join
$array = 1..6
$array -join '-'  #-> "1-2-3-4-5-6"
$array-join'-'    #-> "1-2-3-4-5-6"
$array-join0      #-> "10203040506"


-join$array       #-> "123456"
"$array"            #-> "1 2 3 4 5 6"


# Split

"key=value" -split '='  #-> @("key","value")
"key=value"-split'='    #-> @("key","value")

"key0value"-split0      #-> @("key","value")


-split"One Two Three"   #-> @("One","Two","Three")



# Replace
"949-555-1234"-replace'-',''  #-> "9495551234"


# Remove
"949-555-1234"-replace'-'     #-> "9495551234"

"949055501234"-replace0       #-> "9495551234"

# Chain replace
"949-555-1234"-replace'-'-replace5 #->"9491234"



#endregion whitespace




#region Arrays of strings
$array = @(
    "First"
    "Second"
    "Third"
)

$array = @("First","Second","Third")

$array = "First","Second","Third"



# Skip the quotes
Write-Output First Second Third

echo First Second Third



# split string
"First Second Third"-split" "

-split"First Second Third"

"First line,Second line,Third line"-split','


"First line0Second line0Third line"-split0


# Here-Strings
@"
First
Second
Third
"@


# multiline strings
"First
Second
Third"


"First line
Second line
Third line" -split '\n'


# PreSize arrays
$a = 1..20
$a = @(0) * 20
$a = ,0 * 20
$a = ,0*20



#endregion


#region Variables



# Deconstruction
$value = "something"

# Multiple variable assignemnts at once
$1st,$2nd = @("a","b")
$1st,$2nd = "a","b"
$1st     #-> "a"
$2nd     #-> "b"


$user,$domain = "kevmar@gmail.com" -split '@'
$user      #-> "kevmar"
$domain    #-> "gmail.com"

# Assigning extra values
$1st,$rest = 1,2,3,4,5,6
$1st    #-> 1
$rest   #-> @(2,3,4,5,6)


# Assigning null
$a=$null
$a=$z  # where $z us not defined or $null

$1st='a'
$2nd=$null

$1st,$2nd='a'
$1st    #-> "a"
$2nd    #-> $null



# Swap variables
$1st,$2nd = 'a','b'

$tmp = $1st
$1st = $2nd
$2nd = $tmp

$1st,$2nd = $2nd,$1st
$1st    #-> "a"
$2nd    #-> "b"


# Chaining Assignment
$1st = $2nd = $3rd = "c"
$1st    #-> "c"
$2nd    #-> "c"
$3rd    #-> "c"



# Assigning and Return
$n="a"    #-> no output
($n="a")  #-> "a"


# add 1
$n = 0
$n = $n + 1
$n += 1

$n++    # use value then add 1
++$n    # add 1 then use value


$j=$k=1
($j++)   #-> 1
(++$k)   #-> 2

$j=$k=1
$j++ + 20  #-> 21
++$k + 20  #-> 22
$j  #-> 2
$k  #-> 2

Remove-Variable j
Remove-Variable k
($j++)   #-> 0
(++$k)   #-> 1



# assigning from if
$a= $true
if($a){
    $n = 3
} else {
    $n = 4
}

$n = if($a){
    3
}else{
    4
}

$a= $true
$n = if($a){3}else{4}


# ternary operator
# $n = <expression> ? <true> : <false>
$n = $a ? 3 : 4


# old school array based ternary operator
$n = @(4,3)[$a]
$n = (4,3)[$a]


# unary operator (select one or nothing)
$b=3
$a=$false
$n = if(!$a){$b}
$n = ($b,$null)[$a]
$n = ($b)[$a]
$n = $b[$a]
$n = $b[-1]


# note on strings
"fizz"[1]  # -> [char]'i'

@("fizz")[1] # ->  $null
{"fizz"}[1] # ->  $null
"fizz"*0 # -> [string]::Empty

$null -eq [string]::Empty # -> $false
#endregion



#region Iterating Numbers

# for (init; condition; increment)
for($n=1; $n -le 100; $n++){$n}

# weird incomming
# optional sections
# for infinite loop
for(;;){Get-Date}
for(){Get-Date}

while(1){Get-Date}


# foreach($item in $collection) loop
foreach($n in 1..100){$n}


# foreach collection method
(1..100).foreach({$_})
(1..100).foreach{$_}

# foreach pipeline
1..100 | ForEach-Object {$_}
1..100 | %{$_}

#12 char
1..100|%{$_}


#endregion


#region Filtering
1..6 | Where-Object { $_ -gt 3}   #-> @(4,5,6)
1..6 | Where { $_ -gt 3}

1..6 | ?{ $_ -gt 3 }
1..6|?{$_-gt3}


# -eq -gt -lt with collections
1..6 -gt 3   #-> @(4,5,6)
1..6-gt3     #-> @(4,5,6)

# works with match
"one","two","three" -match 'e'  #-> @("one","three")

#endregion


# catch from pipeline
$a=$true
$n = if($a){3}else{4}
$n = for($i=1;$i -le 10;$i++){$i}
$n = foreach($i in 1..10){$i}
$n = switch('a'){'a'{3}'b'{4}}


# weird incomming
# trailing newline optional?
$n = if($a){3}else{4}
5
$n = if($a){3}else{4};5
$n = if($a){3}else{4}5

$n = for($i=1;$i -le 10;$i++){$i}5
$n = foreach($i in 1..10){$i}5
$n = switch('a'){'a'{3}'b'{4}}5


#region Aliases
1..6|Where-Object {$_ -gt 3}   #-> @(4,5,6)
1..6|?{$_ -gt 3}   #-> @(4,5,6)
1..100|ForEach-Object {$_}
1..100|%{$_}

"Hello, World!"|Out-Host  # -> "Hello, World!"
"Hello, World!"|oh        # -> "Hello, World!"


# Soft Get-* Alaises
Get-Date
Date

Get-Service
Service

Get-Verb
Verb

#endregion