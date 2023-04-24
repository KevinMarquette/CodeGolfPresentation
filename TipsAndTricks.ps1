function prompt {"#PSHSummit>"};Clear-Host







# Printing Output for code.golf
Write-Host 'Hello, World!'
Write-Output 'Hello, World!'

'Hello, World!'



# Output Notations
Get-Date  #-> "Wednesday, April 1, 2022 3:41:01 PM"
1 + 2     #-> 3



#region Whitespace
# .vscode\settings.json
# "editor.renderWhitespace":"all"
if ( $true ) {
    "Whitespace"
}

if($true){"Whitespace"}



# Math
1 + 2 - 3 * 4 % 5
1+2-3*4%5

$a+$b-$c*$d%$e



# Pipeline
$array = @(1,2,3)
$array | ForEach-Object { $_ }
$array|ForEach-Object{$_}
$array|%{$_}




# Comparison
5 -eq 5
5-eq5

$a-eq$b


5 -eq 5 -and 5 -ne 9
5-eq5-and5-ne9
$a-eq$b-and$c-ne$d



# Join
$array = 1..6
$array -join '-'  #-> "1-2-3-4-5-6"
$array-join'-'    #-> "1-2-3-4-5-6"
$array-join0      #-> "10203040506"


-join$array       #-> "123456"
$array            #-> "1 2 3 4 5 6"


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

@("First","Second","Third")
"First","Second","Third"



# Skip the quotes
Write-Output First Second Third

echo First Second Third



# split string
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


# assign null in fewest charaters
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


# Assing and Return
$n="a"    #-> no output
($n="a")  #-> "a"


# add 1
$n = 0
$n = $n + 1
$n += 1

$n++    # use value then add 1
++$n    # add 1 then use value

$j=$k=1
$j++ + 20  #-> 21
++$k + 20  #-> 22
$j  #-> 2
$k  #-> 2

$j=$k=1
($j++)   #-> 1
(++$k)   #-> 2



#endregion



#region Iterating Numbers
# foreach($item in $collection)

foreach($n in 1..100){$n}

# for (init; condition; increment)
for($n=1; $n -le 100; $n++){$n}

# optional sections
# for infinite loop
for(;;){Get-Date}
for(){Get-Date}

while(1){Get-Date}


#pipeline
1..100 | ForEach-Object {$_}
1..100 | %{$_}

#12 char
1..100|%{$_}

#endregion
