# Iterating Numbers

# 23: foreach($item in $collection)
foreach($n in 1..5){$n}


# for (init; condition; increment)
for($n=1; $n -le 5; $n++){$n}
for($n=1;$n-le5;$n++){$n} # 25 no spaces


# each section is optional
for($n=1;$n-le5;){($n++)}
for($n=1;$n-le5){($n++)} # 24




# start from 0
Remove-Variable -Name n -ErrorAction Ignore
Remove-Variable -Name m -ErrorAction Ignore
for(;$n-lt5){(++$n)} # 20
for(;$m++-lt5){$m} # 18





# Pipeline ForEach-Object
1..5 | ForEach-Object{$_} #25
1..5 | %{$_} # 12

1..5|%{$_} # 10 no spaces

1..5|%{$n=$_;$n} # 16



# Infinite while loops

while($true){Get-Date} # 22
while(1){Get-Date} # 18


# Infinite for loops

for(;1;){Get-Date} # 18
for(;;){Get-Date} # 17
for(){Get-Date} #15

