<#
Solutions on code.golf can be awarded one of three medals: 
bronze (🥉) for 3rd place, silver (🥈) for 2nd place, or gold (🥇) for 1st place. 
In addition, an uncontested 1st place solution is awarded a diamond (💎). 
Tied solutions are all awarded the same medal.

Given a list of space-separated solution scores in ascending order, print the corresponding diamonds and medals.

Examples:

9 9 = 2🥇 = only two identical numbers... grants two gold medals. Because > 1 gold medal, no diamond.

9 14 17 17 41 50 =1💎 1🥇 1🥈 2🥉 = one 9 point solution gives one gold and one diamond, 
    then one 14 point solution gives silver, 
    and two solutions with 17 points equals 2 bronze medals.

10 10 10 41 41 = 3🥇 = Solutions 1, 2 and 3 are all tied at 10. The 4th place was 41 and didn't medal.

3 3 19 19 37 59 =2🥇 2🥉 = Solutions 1 and 2 tied at 3 for gold. Solutions 3 and 4 tied at 19 for silver. 
    5th place at 37 didn't medal.

#>

# Test Cases
$argg = echo "1 2 3 4" "9 9" "9 14 17 17 41 50" "10 10 10 41 41" "3 3 19 19 37 59"

# basic solutioning
$data = $argg[0].split(" ") 
$group = $data | Group-Object
$medals = echo 🥇 🥈 🥉




