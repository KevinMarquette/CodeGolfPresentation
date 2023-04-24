<#
Given a MM-DD HH:MM date and time, output the corresponding Zodiac sign symbol according to the first table below. If the ascending sign is different from the Zodiac sign (sun sign), output it as well. Approximate the ascending sign using the sun sign and time according to the second table below.

Aries	    ♈	March 21 – April 19
Taurus	    ♉	April 20 – May 20
Gemini	    ♊	May 21 – June 21
Cancer	    ♋	June 22 – July 22
Leo	        ♌	July 23 – August 22
Virgo	    ♍	August 23 – September 22
Libra	    ♎	September 23 – October 22
Scorpio	    ♏	October 23 – November 22
Sagittarius	♐	November 23 – December 21
Capricorn	♑	December 22 – January 19
Aquarius	♒	January 20 – February 18
Pisces	    ♓	February 19 – March 20

00:00 - 01:59	♒	♓	♈	♉	♊	♋	♌	♍	♎	♏	♐	♑
02:00 - 03:59	♓	♈	♉	♊	♋	♌	♍	♎	♏	♐	♑	♒
04:00 - 05:59	♈	♉	♊	♋	♌	♍	♎	♏	♐	♑	♒	♓
06:00 - 07:59	♉	♊	♋	♌	♍	♎	♏	♐	♑	♒	♓	♈
08:00 - 09:59	♊	♋	♌	♍	♎	♏	♐	♑	♒	♓	♈	♉
10:00 - 11:59	♋	♌	♍	♎	♏	♐	♑	♒	♓	♈	♉	♊
12:00 - 13:59	♌	♍	♎	♏	♐	♑	♒	♓	♈	♉	♊	♋
14:00 - 15:59	♍	♎	♏	♐	♑	♒	♓	♈	♉	♊	♋	♌
16:00 - 17:59	♎	♏	♐	♑	♒	♓	♈	♉	♊	♋	♌	♍
18:00 - 19:59	♏	♐	♑	♒	♓	♈	♉	♊	♋	♌	♍	♎
20:00 - 21:59	♐	♑	♒	♓	♈	♉	♊	♋	♌	♍	♎	♏
22:00 - 23:59	♑	♒	♓	♈	♉	♊	♋	♌	♍	♎	♏	♐

Example Input
09-27 09:39
01-09 07:52
10-30 18:04

Output
♎♐
♑♒
♏♊

#>
$s="♑♒♓♈♉♊♋♌♍♎♏♐♑"
$t=echo 99:99 00:00 02:00 04:00 06:00 08:00 10:00 12:00 14:00 16:00 18:00 20:00 22:00
$d=echo 00-00 01-20 02-19 03-21 04-20 05-21 06-22 07-23 08-23 09-23 10-23 11-23 12-22
$args|%{
    $f,$g=$_-split " "
    0..12|%{
        if($f-ge$d[$_]){
            $x=$_
        }
        if($g-ge$t[$_]){
            $y=$_
        }
    }
    $n=$s[$x]
    $m=$s[($x+$y)%12]
    $n-eq$m ?$n :"$n$m"
}


$s="♑♒♓♈♉♊♋♌♍♎♏♐♑"
$t=echo 99:99 00:00 02:00 04:00 06:00 08:00 10:00 12:00 14:00 16:00 18:00 20:00 22:00
$d=echo 00-00 01-20 02-19 03-21 04-20 05-21 06-22 07-23 08-23 09-23 10-23 11-23 12-22
$args|%{$f,$g=$_-split" "
0..12|%{if($f-ge$d[$_]){$x=$_}
if($g-ge$t[$_]){$y=$_}}
$n,$m=$s[$x,($x+$y+9)%12]
$n-eq$m ?$n :"$n$m"}