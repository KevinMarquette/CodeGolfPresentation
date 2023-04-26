<# https://code.golf/arrows#powershell

Starting at [0, 0] print the cumulative result of 
applying each of the given Unicode arrow arguments. 

The arrows will be a random combination of these:
[-1, -1]	↙ U+2199, ↲ U+21B2, ⇙ U+21D9
[-1,  0]	← U+2190, ⇐ U+21D0, ⇦ U+21E6
[-1,  1]	↖ U+2196, ↰ U+21B0, ⇖ U+21D6
[ 0, -1]	↓ U+2193, ⇓ U+21D3, ⇩ U+21E9
[ 0,  0]	↔ U+2194, ↕ U+2195, ⇔ U+21D4, ⇕ U+21D5, ⥀ U+2940, ⥁ U+2941
[ 0,  1]	↑ U+2191, ⇑ U+21D1, ⇧ U+21E7
[ 1, -1]	↘ U+2198, ↳ U+21B3, ⇘ U+21D8
[ 1,  0]	→ U+2192, ⇒ U+21D2, ⇨ U+21E8
[ 1,  1]	↗ U+2197, ↱ U+21B1, ⇗ U+21D7


Input: 
    ⇑⇒↗⇧↑↗↑⇑⇒⇒

Output:
0 1
1 1
2 2
2 3
2 4
3 5
3 6
3 7
4 7
5 7

#>



# 334: First Draft -> Giant hashtable

$m=@{
'↙'=-1,-1
'↲'=-1,-1
'⇙'=-1,-1
'←'=-1,0
'⇐'=-1,0
'⇦'=-1,0
'↖'=-1,1
'↰'=-1,1
'⇖'=-1,1
'↓'=0,-1
'⇓'=0,-1
'⇩'=0,-1
'↑'=0,1
'⇑'=0,1
'⇧'=0,1
'↘'=1,-1
'↳'=1,-1
'⇘'=1,-1
'→'=1,0
'⇒'=1,0
'⇨'=1,0
'↗'=1,1
'↱'=1,1
'⇗'=1,1
'↔'=0,0
'↕'=0,0
'⇔'=0,0
'⇕'=0,0
'⥀'=0,0
'⥁'=0,0
}
$x=0
$y=0
$args|%{
    $x+=$m[$_][0]
    $y+=$m[$_][1]
    "$x $y"
}


# lets try something else
$m=@{
'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1
'↔↕⇔⇕⥀⥁'=0,0
}
$arrow='↘'
$key = $m.keys | Where-Object {$_ -match $arrow}
$m[$key]


# match
$m.keys | Where-Object {$_ -match $arrow}
$m.keys|?{$_ -match $arrow}

$m.keys -match $arrow


# Unexpected behaviour

$hahstable=@{
    a=1
    b=2
    c=3
}
$hahstable["a"]          #-> 1
$hahstable["a","b"]      #-> @(1,2)
$hahstable["a","b","a"]  #-> @(1,2,1)
$hahstable[@("a")]       #-> @(1)
$hahstable[,"a"]       #-> @(1)

ConvertTo-Json $hahstable["a"]
ConvertTo-Json $hahstable[@("a")]


# Why does that matter?

ConvertTo-Json $m['↘↳⇘']     #-> @(1,-1)

$arrow='↘'
$key=$m.keys -match $arrow
$value=$m[$key]

ConvertTo-Json $key        #-> @("↙↲⇙")
ConvertTo-Json $m[$key]    #-> @(@(1,-1))


$value[0]      #-> @(1,-1)
$value[1]      #-> $null
$value[0][0]   #-> 1
$value[0][1]   #-> -1


# 199: back to challenge, use -match
$m=@{
'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1
'↔↕⇔⇕⥀⥁'=0,0
}
$x=0
$y=0
$args|%{
    $v=$m[$m.keys -match $_][0]
    $x+=$v[0]
    $y+=$v[1]
    "$x $y"
}


# 191: remove '↔↕⇔⇕⥀⥁'=0,0 case

$m=@{
'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1
}
$x=0
$y=0
$args|%{
    $v=$m[$m.keys -match $_][0]??0,0
    $x+=$v[0]
    $y+=$v[1]
    "$x $y"
}

# 181: remove $x=0 and $y=0
Remove-Variable x
Remove-Variable y

$m=@{
'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1
}
$args|%{
    $v=$m[$m.keys -match $_][0]??0,0
    $x+=$v[0]
    $y+=$v[1]
    "$x $y"
}


# 159: Remove whitespace
$m=@{'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1}
$args|%{$v=$m[$m.keys-match$_][0]??0,0
$x+=$v[0]
$y+=$v[1]
"$x $y"}


# Inline $x and $y trial and error

$v=@(1,2)
$v        #-> @(1,2)
"$v"      #-> "1 2" 
""+$v     #-> "1 2"


$x=$y=0
$x+=$v[0]
$y+=$v[1]
"$x $y"   #29:->  "1 2"
"$($x,$y)"   #->  "1 2"

"$(($x+=$v[0]),($y+=$v[1]))"   # 28: -> "1 2"

''+($x+=$v[0])+' '+($y+=$v[1]) # 30: -> "1 2"

''+($x+=$v[0]),($y+=$v[1])     # 26: -> "1 2"



# 158: inline x and y

$m=@{'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1}
$args|%{$v=$m[$m.keys-match$_][0]??0,0
''+($x+=$v[0]),($y+=$v[1])}


# 157: inline hashtable

$args|%{$v=($m=@{'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1})[$m.keys-match$_][0]??0,0
''+($x+=$v[0]),($y+=$v[1])}



# Expert Audience Challenge: Who spotted 1 more? (2 char)


1+0     #-> 1
1+$null #-> 1

$v=0,0
$v[0]   #-> 0
$v[1]   #-> 0

$v=0
$v[0]   #-> 0
$v[1]   #-> $null


# 155: Final answer

$args|%{$v=($m=@{'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1})[$m.keys-match$_][0]??0
''+($x+=$v[0]),($y+=$v[1])}











# 200: original from 2023
$c=,(0,0)
$args|%{$m=@{'↙↲⇙'=-1,-1
'←⇐⇦'=-1,0
'↖↰⇖'=-1,1
'↓⇓⇩'=0,-1
'↑⇑⇧'=0,1
'↘↳⇘'=1,-1
'→⇒⇨'=1,0
'↗↱⇗'=1,1}
$c+=($d=$m[$m.keys-match$_])?$d :,(0,0)}
$c[1..$c.count]|%{''+($x+=$_[0])+' '+($y+=$_[1])}