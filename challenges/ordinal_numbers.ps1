



# code golf ordinal numbers 0 to 999 inclusive
$args|%{$_+(($b=($t=,'th'),'st','nd','rd'+$t*6)+$t*10+$b*8)[$_%100]}


1..30|%{"$_"}|%{
$t=('th','st','nd','rd'+ (,'th'*6))*10
$t[11]=$t[12]=$t[13]='th'
$_+$t[$_%100]
}


1..30|%{"$_"}|%{
$t=('th','st','nd','rd'+ (,'th'*6))*10
$t[11]=$t[12]=$t[13]='th'
$_+$t[$_%100]
}

$args|%{$t=('th','st','nd','rd'+,'th'*6)*10
$t[11]=$t[12]=$t[13]='th'
$_+$t[$_%100]}



$args|%{$t=($z,'st','nd','rd'+,$z*6)*10
$_+($t[$_%100]??'th')}

1..30|%{"$_"}|%{
$p=if($_[-2]-eq'1'){
    'th'
    }else{
        ($z,'st','nd','rd')[$_%10]
    }
    $_+($p ?? 'th')
}

1..30|%{"$_"}|%{$_+($_[-2]-eq'1'?'th':($z,'st','nd','rd')[$_%10]??'th')}

$args|%{$_+($_[-2]-eq'1'?'th':($z,'st','nd','rd')[$_%10]??'th')}

$args|%{$_+($_[-2]-eq49?'th':($z,'st','nd','rd')[$_%10]??'th')}

$args|%{$_+($_[-2]-eq49?'th':($z,'st','nd','rd')[$_%10]??'th')}

$args|%{$_+($_[-2]-49?($z,'st','nd','rd')[$_%10]??'th':'th')}

$args|%{$_+((!$_[-2]?$z :($z,'st','nd','rd')[$_%10])??'th')}


$args|%{$_+(($z,'st','nd','rd')[$_%10*($_[-2]-ne49)]??'th')}

$args|%{$_+(($z,'st','nd','rd')[$_%10*!($_[-2]-49)]??'th')}

$args|%{$_+(($z,'st','nd','rd')[$_%10*($_[-2]-ne49)]??'th')}
$args|%{$_+(($z,'st','nd','rd')[$_%10*($_[-2]-ne49)]??'th')}


$args|%{$_+(($z,'st','nd','rd')[$_%10*($_[-2]-ne49)]??'th')}
$args|%{$_+({($z,'st','nd','rd')[$_%10]}[!$_[-2]-49]??'th')}

$args|%{$_+((echo $z st nd rd)[$_%10*($_[-2]-ne49)]??'th')}

$args|%{$_+((echo $z st nd rd)*($_[-2]-ne49)[$_%10]??'th')}
$args|%{$_+(((echo $z st nd rd)*!($_[-2]-49))[$_%10]??'th')}

$args|%{$_+((echo $z st nd rd)[($m=$_%10)*($_%100-$m-ne10)]??'th')}

$args|%{$_+((,(echo $z st nd rd)[$_%10])[$_[-2]-eq49]??'th')}

$args|%{$_+((,(echo $ st nd rd)[$_%10])[$_[-2]-eq49]??'th')}

$args|%{$_+((echo $z st nd rd)[$_%10*($_[-2]-ne49)]??'th')}


# Final version 59
$args|%{$_+((echo th st nd rd)[$_%10*($_[-2]-ne49)]??'th')}