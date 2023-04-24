<#
# Prime Numbers

Print all the prime numbers from 1 to 100 inclusive, each on their own line.
https://code.golf/prime-numbers#powershell

Prime number is a whole number greater than 1 that cannot be exactly divided by any whole number other than itself and 1:

## Prime Numbers between 1 and 100
2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97

#>


<#
Article: Prime Numbers in PowerShell
Link: https://www.tunbury.org/prime-numbers-in-powershell/
Author: Mark Elvers
Twitter: @mtelvers
#>

# sieve
$ints = 0..100
# 
for ($i = 2; $i -lt [Math]::Sqrt($ints.length); $i++) {
    if ($ints[$i] -eq 0) {
        continue
    }
    for ($j = $i * $i; $j -lt $ints.length; $j += $i) {
        $ints[$j] = 0
    }
}
$ints | foreach { if ($_) { Write-Host -NoNewLine "$_ " } }



# 62: sieve
 
($i=0..97)[2..97]|?{$i[$_]
for($j=$_;($j+=$_)-le97){$i[$j]=0}}


# 49: /w hashtable

$h=@{}
2..10000|?{!$h[($n=$_)]
2..100|?{$h[$n*$_]=1}}


$h=@{}
2..100|%{if(!$h[($n=$_)]){2..9973|%{$h[$n*$_]=1}}}
2..9973|?{!$h[$_]}

$h=@{}
2..99|%{if(!$h[($n=$_)]){2..9973|%{$h[$n*$_]=1}}}
2..9973|?{!$h[$_]}

$h=@{}
2..99|%{$n=$_;2..9973|%{$h[$n*$_]=1}}
2..9973|?{!$h[$_]}

$h=@{}
2..99|%{$n=$_;2..5000|%{$h[$n*$_]=1}}
2..9973|?{!$h[$_]}

$h=@{}
2..99|%{$n=$_;1..2500|%{$h[$n*$_*2]=1}}
2..9973|?{!$h[$_]}

