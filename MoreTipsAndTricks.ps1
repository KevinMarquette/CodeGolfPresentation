# Code.golf
# Printing Output
Write-Host 'Hello, World!'
Write-Output 'Hello, World!'

'Hello, World!'



# Accessing arguments
$args|%{
    $_
}



# Unicode Characters
"😀🙂😐"




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

