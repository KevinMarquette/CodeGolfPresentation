$args|%{for($s=$i=0;$_[$i];$i++){$s+=($v=($r=@{I=1;V=5;X=10;L=50;C=100;D=500;M=1000;0=0})["$($_[$i])"??0])-lt$r["$($_[$i+1])"??0]??0?-$v :$v}
"$s"}



$args|%{($m='✂📄0📄💎0💎🦎0🦎🖖0🖖✂0✂🦎0🦎📄0📄🖖0🖖💎0💎✂0📄✂0💎📄0🦎💎0🖖🦎0✂🖖0🦎✂0📄🦎0🖖📄0💎🖖0✂💎0Tie0✂ cuts 📄0📄 covers 💎0💎 crushes 🦎0🦎 poisons 🖖0🖖 smashes ✂0✂ decapitates 🦎0🦎 eats 📄0📄 disproves 🖖0🖖 vaporizes 💎0💎 crushes ✂'-split0)[$m.IndexOf("$_")%10+21]}


@('✂📄,📄💎,💎🦎,🦎🖖,🖖✂,✂🦎,🦎📄,📄🖖,🖖💎,💎✂,📄✂,💎📄,🦎💎,🖖🦎,✂🖖,🦎✂,📄🦎,🖖📄,💎🖖,✂💎,Tie,✂ cuts 📄,📄 covers 💎,💎 crushes 🦎,🦎 poisons 🖖,🖖 smashes ✂,✂ decapitates 🦎,🦎 eats 📄,📄 disproves 🖖,🖖 vaporizes 💎,💎 crushes ✂'-split',')[$args]

