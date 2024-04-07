
# original: 2022
$args|%{$o,$p='',0
$a=@(0)*100
"$($_[0..1000]|%{('while($a[$p]){!!}!!$a[$p]++!!$a[$p]--!$o+=,[char]$a[$p]-ne10!$p--!!$p++!!'-split'!')[$_%13]+';'})"|Invoke-Expression
$o}


# replace while with for('ever')
$args|%{$o,$p='',0
$a=@(0)*100
"$($_[0..1000]|%{('for(;$a[$p]){!!}!!$a[$p]++!!$a[$p]--!$o+=,[char]$a[$p]-ne10!$p--!!$p++!!'-split'!')[$_%13]+';'})"|Invoke-Expression
$o}



# change array syntax
$args|%{$o,$p='',0
$a=,0*100
"$($_[0..1000]|%{('for(;$a[$p]){!!}!!$a[$p]++!!$a[$p]--!$o+=,[char]$a[$p]-ne10!$p--!!$p++!!'-split'!')[$_%13]+';'})"|Invoke-Expression
$o}


# 165: split on 9
$args|%{$o,$p='',0
$a=,0*100
"$($_[0..1000]|%{('for(;$a[$p]){99}99$a[$p]++99$a[$p]--9$o+=,[char]$a[$p]-ne109$p--99$p++99'-split9)[$_%13]+';'})"|Invoke-Expression
$o}



# 151: iex alias
$args|%{$o,$p='',0
$a=,0*100
"$($_[0..1000]|%{('for(;$a[$p]){99}99$a[$p]++99$a[$p]--9$o+=,[char]$a[$p]-ne109$p--99$p++99'-split9)[$_%13]+';'})"|iex
$o}


# 149: smaller max numbers
$args|%{$o,$p='',0
$a=,0*99
iex "$($_[0..999]|%{('for(;$a[$p]){99}99$a[$p]++99$a[$p]--9$o+=,[char]$a[$p]-ne109$p--99$p++99'-split9)[$_%13]+';'})"
$o}

# 149: smaller max numbers
$args|%{$o,$p='',0
$a=,0*99
iex "$($_[0..999]|%{('for(;$a[$p]){99}99$a[$p]++99$a[$p]--9$o+=,[char]$a[$p]-ne109$p--99$p++99'-split9)[$_%13]+';'})"
$o}

# 147: use "word" | |% t*y
$args|%{$o,$p='',0
$a=,0*99
iex "$($_|% t*y|%{('for(;$a[$p]){99}99$a[$p]++99$a[$p]--9$o+=,[char]$a[$p]-ne109$p--99$p++99'-split9)[$_%13]+';'})"
$o}