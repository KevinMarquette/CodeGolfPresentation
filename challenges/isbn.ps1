<#
.DESCRIPTION
Calculate the check digit for these incomplete ISBNs.

.NOTES
If the check digit would be 10, write "X" instead.

The check digit of a-bcdef-ghi-? is computed as 
− 10a - 9b - 8c - … - 2i, modulo 11. 
Dashes may occur in varying positions and are ignored. 
Link: https://code.golf/isbn#powershell
#>

# Step 1: Get example input and output
5-801-60639- 5-801-60639-4
8-648679-61- 8-648679-61-3
9-6773-3837- 9-6773-3837-4

# Step 2: Do one by hand.
# 5-801-60639-4
(- 10*5 - 9*8 - 8*0 - 7*1 - 6*6 - 5*0 - 4*6 - 3*3 - 2*9 ) % 11
# ?-> -7

# Step 3: Check external refferences.
# https://isbn-information.com/the-10-digit-isbn.html
# 0-198-52663-6
$r = (10*0 + 9*1 + 8*9 + 7*8 + 6*5 + 5*2 + 4*6 + 3*6 + 2*3 ) % 11
11 - $r  #-> 6

#5-801-60639-4
$r = (10*5 + 9*8 + 8*0 + 7*1 + 6*6 + 5*0 + 4*6 + 3*3 + 2*9 ) % 11
11 - $r  #-> 4

#8-648679-61-3
$r = (10*8 + 9*6 + 8*4 + 7*8 + 6*6 + 5*7 + 4*9 + 3*6 + 2*1 ) % 11
11 - $r  #-> 3

# Step 4: Do it in code
$isbn = '8-648679-61-'
#$isbn = "7-18647-531-"
#$isbn = "2-521-80049-"
$num = $isbn -replace '-',''

$sum = 0
for( $index = 0; $index -lt $num.length; $index++ ){
    $sum += (10 - $index) * $num[$index].Tostring()
}
$result = 11 - ($sum % 11) 
"{0}{1}" -f $isbn,$result
#-> 8-648679-61-3
#-> 7-18647-531-0
#-> 2-521-80049-X


# Step 5: Get clever with pipeline
$isbn = '8-648679-61-'
$num = $isbn -replace '-',''

$sum = 0
$weight = 10
$num[0..9] | ForEach-Object{
    $sum += $weight * $_.ToString()
    $weight--
}
$result = (11 - ($sum % 11)) % 11
if($result -eq 10){
    $result = 'X'
}
"{0}{1}" -f $isbn,$result  #-> 8-648679-61-3


# Full solution
$args | Foreach-Object{
    $isbn = $_
    $num = $isbn -replace '-',''

    $sum = 0
    for($index = 0; $index -lt $num.length; $index++){
        $sum += (10 - $index) * $num[$index].Tostring()
    }
    $result = (11 - ($sum % 11)) % 11
    if($result -eq 10){
        $result = 'X'
    }
    "{0}{1}" -f $isbn,$result  #-> 8-648679-61-3
}

# String vs Number 
"Hello" * 2  #-> "HelloHello"
"3" * 2      #-> "33"
"123" * 2    #-> "123123"
"123" * 0    #-> [string]::Empty
"123" * $true    #-> "123"
"123" * $false   #-> [string]::Empty

2 * "Hello"        #-> InvalidArgument: cannot convert to Int
2 * "3"            #-> 6
0 * "3"            #-> 0
[int]2 * [int]"3"  #-> 6


# Char
$str = '0123456'
$str.GetType()     #-> String
$str[0].GetType()  #-> Char
$c = $str[2]
$c            #-> '2'
$c.GetType()  #-> Char
[int]$c       #-> 50 ASCII https://en.wikipedia.org/wiki/ASCII

[char]50      #-> '2'
[char]48      #-> '0'
[char]57      #-> '9'
[char]65      #-> 'A'
[char]90      #-> 'Z'
[char]97      #-> 'a'
[char]122     #-> 'z'
[int][char]"m"#-> 109

$message = "hello"
$message[0] -gt 90 
$message[0] -gt 'Z' 

# Math with char
$c            #-> '2'
[int]$c       #-> 50
$c * 3        #-> InvalidOperation: Char * Int not defined
3 * $c        #-> 150
1 * $c        #-> 50



# Char as a number
$c - "0"[0]   #-> 2
$c - 48       #-> 2

3 * $c.ToString() #-> 6
3 * ($c-48)       #-> 6
3 * "$($c)"
3 * "$c"
3 * ($c|% ToString)
3 * ($c|% *g)

$str[0..6]|%{"$_"}
$str[0..6]|% *g

# 

# back to ISBN
$sum = 0
$weight = 10
$num[0..9] | ForEach-Object{
    $sum += $weight * $_.ToString()
    $weight--
}
$result = (11 - ($sum % 11)) % 11
if($result -eq 10){
    $result = 'X'
}
"{0}{1}" -f $isbn,$result

$s=0
$w=10
$num[0..9]|%{$s+=($w--)*"$_"}
$r = (11 - ($s % 11)) % 11
if($r -eq 10){
    $r = 'X'
}
"{0}{1}" -f $isbn,$r


# result
$result = (11 - ($sum % 11)) % 11

$r=(11-$s%11)%11

$s=0
$w=10
$num[0..9]|%{$s+=($w--)*"$_"}
$r=(11-$s%11)%11
if($r -eq 10){
    $r = 'X'
}
"{0}{1}" -f $isbn,$r


# handling 10
if($result -eq 10){
    $result = 'X'
}

if($r-eq10){$r='X'}

$r=$r-eq10?'X':$r

$r=$r-10?$r :'X'
$r=($r,'X')[$r-10]


$s=0
$w=10
$num[0..9]|%{$s+=($w--)*"$_"}
$r=(11-$s%11)%11
$r=$r-10?$r :'X'
"{0}{1}" -f $isbn,$r

# output
$r=$r-10?'X':$r
"{0}{1}" -f $isbn,$r

$isbn+$r

$isbn+($r-10?$r :'X')

#83
$s=0
$w=10
$num[0..9]|%{$s+=($w--)*"$_"}
$r=(11-$s%11)%11
$isbn+($r-10?$r :'X')





# full solution
$args | Foreach-Object{
    $isbn = $_
    $num = $isbn -replace '-',''
    $s=0
    $w=10
    $num[0..9]|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $isbn+($r-10?$r :'X')
}

# remove dash
$isbn -replace '-',''
$isbn.ToCharArray() -ne '-'
$isbn.ToCharArray() -ne 45
$isbn|% *ay|?{$_-ne45}
$isbn|% *ay|?{$_-45}
($isbn|% *ay)-ne45
$isbn[0..11]-ne45


# full solution
$args | Foreach-Object{
    $isbn=$_
    $num = $isbn[0..11]-ne45
    $s=0
    $w=10
    $num[0..9]|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $isbn+($r-10?$r :'X')
}


# remove $num
$args | Foreach-Object{
    $isbn=$_
    $s=0
    $w=10
    $isbn[0..11]-ne45|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $isbn+($r-10?$r :'X')
}




# remove $isbn
$args | Foreach-Object{
    $i=$_
    $s=0
    $w=10
    $i[0..11]-ne45|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $i+($r-10?$r :'X')
}

# 0 to 10 instead of 11 characters
$args | Foreach-Object{
    $i=$_
    $s=0
    $w=10
    $i[0..10]-ne45|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $i+($r-10?$r :'X')
}

$args | Foreach-Object{
    $i=$_
    $i[($s=0)..($w=10)]-ne45|%{$s+=($w--)*"$_"}
    $r=(11-$s%11)%11
    $i+($r-10?$r :'X')
}

$args | Foreach-Object{
    $i=$_
    $i[($s=0)..($w=10)]-ne45|%{$s+=($w--)*"$_"}
    $i+(($r=(11-$s%11)%11)-10?$r :'X')
}

$args | Foreach-Object{
    $i=$_
    $i[($s=0)..($w=10)]-ne45|%{$s+=($w--)*"$_"}
    $i+(($r=(11-$s%11)%11)-10?$r :'X')
}


# single lines and remove $i=$_
$args|%{$_[($s=0)..($w=10)]-ne45|%{$s+=($w--)*"$_"}
$_+(($r=(11-$s%11)%11)-10?$r :'X')}


# fix ($w--)
#86
$args|%{$_[($s=0)..($w=10)]-ne45|%{$s+=$w--*"$_"}
$_+(($r=(11-$s%11)%11)-10?$r :'X')}



$isbn+($r-10?'X':$r)


$result = (11 - ($s % 11)) % 11
if($result -eq 10){
    $result = 'X'
}
"{0}{1}" -f $isbn,$result  #-> 8-648679-61-3



