
$args2 = echo 2053-02-05 6200-04-21 1646-08-07

# 35 char
$args2.foreach([datetime]).dayofweek

$args2 | Get-Date | % DayOfWeek

$args2| Date|% D*k

# 16 characters
$args|date|% D*k