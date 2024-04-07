<#
Given a date in the YYYY-MM-DD format between 1583-01-01 and 9999-12-31 inclusive, 
output the English name of the corresponding day of the week.


Example dates
2024-04-09 -> Tuesday
2053-02-05 -> Wednesday
6200-04-24 -> Thursday
1646-08-10 -> Friday

Target: 16 characters
#>







# Get Day of week from a date
$date = [datetime]"2024-04-09"

$date.ToString("dddd")  # 22 char
"{0:dddd}"-f$date  # 17 char

$date.DayOfWeek  # 15 char


# Example input dates
$arg5 = "2024-04-09","2053-02-05","6200-04-24","1646-08-10"




# 74: Convert the input dates to DateTime objects

foreach($date in $arg5){
    $date = [datetime]$date
    $date.DayOfWeek
}



# 58: DayOfWeek more inline
foreach($date in $arg5){
    ([datetime]$date).DayOfWeek
}


# 46: foreach one liner
foreach($d in $arg5){([datetime]$d).DayOfWeek}



# 41: foreach method
$args.foreach({([datetime]$_).DayOfWeek})


# Digging deeper on foreach method
$arg5.foreach({[datetime]$_}).foreach({$_.DayOfWeek})

$arg5.foreach([datetime]).foreach("DayOfWeek")

$arg5.foreach([datetime]).DayOfWeek  # 35 char



# 29: Typecast whole array to datetime
([datetime[]]$arg5).DayOfWeek



# 33: ForEach-Object
$arg5 | ForEach-Object {([datetime]$_).DayOfWeek}
$arg5|%{([datetime]$_).DayOfWeek}  # 33 char


# Digging deeper on ForEach-Object
[datetime[]]$arg5|%{$_.DayOfWeek}  # 33 char

[datetime[]]$arg5|% DayOfWeek  # 29 char


# Wildcard Magic
[datetime[]]$arg5|% Day*Week
[datetime[]]$arg5|% D*k  # 23 char



# How do we get to 16 characters?

# What about Get-Date?

Get-Date -Date "2024-04-10"

Get-Date -Date "2024-04-10" -Format dddd

$arg5 | Get-Date -Format dddd  # 30 char
$arg5|Get-Date -F dddd  # 22 char


# Soft Aliasing (Get-Date -> Date)
Set-Alias -Name Date -Value Get-Date

$arg5|Date -F dddd  # 18 char


# Combine our best solutions
$arg5|Date|% D*k  # 16 char


# 16: Final solution
$args|date|% D*k
