
<#
Print the lyrics to the song The 12 Days of Christmas:

On the First day of Christmas
My true love sent to me
A Partridge in a Pear Tree.
…
On the Twelfth day of Christmas
My true love sent to me
Twelve Drummers Drumming,
Eleven Pipers Piping,
Ten Lords-a-Leaping,
Nine Ladies Dancing,
Eight Maids-a-Milking,
Seven Swans-a-Swimming,
Six Geese-a-Laying,
Five Gold Rings,
Four Calling Birds,
Three French Hens,
Two Turtle Doves, and
A Partridge in a Pear Tree.


#>

# 674: First attempt

$days = @(
    "First"
    "Second"
    "Third"
    "Fourth"
    "Fifth"
    "Sixth"
    "Seventh"
    "Eighth"
    "Ninth"
    "Tenth"
    "Eleventh"
    "Twelfth"
)

$song=@(
    "A Partridge in a Pear Tree."
    "Two Turtle Doves, and"
    "Three French Hens,"
    "Four Calling Birds,"
    "Five Gold Rings,"
    "Six Geese-a-Laying,"
    "Seven Swans-a-Swimming,"
    "Eight Maids-a-Milking,"
    "Nine Ladies Dancing,"
    "Ten Lords-a-Leaping,"
    "Eleven Pipers Piping,"
    "Twelve Drummers Drumming,"
)

for($index=0; $index -lt $days.Count; $index++){
    "On the {0} day of Christmas" -f $days[$index]
    "My true love sent to me"
    $song[$index..0]
    ""
}



# Compressing Arrays


@(
"First"
"Second"
"Third"
)

echo First Second Third

echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth


# Multi-Edit example
$days = @(
    "First"
    "Second"
    "Third"
    "Fourth"
    "Fifth"
    "Sixth"
    "Seventh"
    "Eighth"
    "Ninth"
    "Tenth"
    "Eleventh"
    "Twelfth"
)



# Array of strings
$song=@(
    "A Partridge in a Pear Tree."
    "Two Turtle Doves, and"
    "Three French Hens,"
)

# Here string and split

$song = @"
A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
"@ -split '\n'



$song = "A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,"-split'\n'



# 551: All together

$days=echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth
$song="A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Laying,
Seven Swans-a-Swimming,
Eight Maids-a-Milking,
Nine Ladies Dancing,
Ten Lords-a-Leaping,
Eleven Pipers Piping,
Twelve Drummers Drumming,"-split'\n'
for($index=0;$index -lt $days.Count;$index++){
    "On the {0} day of Christmas" -f $days[$index]
    "My true love sent to me"
    $song[$index..0]
    ""
}



# 162 for loop

for($index=0;$index -lt $days.Count;$index++){
    "On the {0} day of Christmas" -f $days[$index]
    "My true love sent to me"
    $song[$index..0]
    ""
}


# 116 ForEach-Object

0..11|%{
    "On the {0} day of Christmas" -f $days[$_]
    "My true love sent to me"
    $song[$_..0]
    ""
}


# 111: loop on days

$i=0
$days|%{
    "On the {0} day of Christmas" -f $_
    "My true love sent to me"
    $song[$i++..0]
    ""
}


# inline variable
"On the {0} day of Christmas" -f $_
"On the $_ day of Christmas"


# 104
$i=0
$days|%{
    "On the $_ day of Christmas"
    "My true love sent to me"
    $song[$i++..0]
    ""
}


# 478: All together again
$days=echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth
$song="A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Laying,
Seven Swans-a-Swimming,
Eight Maids-a-Milking,
Nine Ladies Dancing,
Ten Lords-a-Leaping,
Eleven Pipers Piping,
Twelve Drummers Drumming,"-split'\n'
$i=0
$days|%{
    "On the $_ day of Christmas"
    "My true love sent to me"
    $song[$i++..0]
    ""
}



# 466: Inline Days

$song="A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Laying,
Seven Swans-a-Swimming,
Eight Maids-a-Milking,
Nine Ladies Dancing,
Ten Lords-a-Leaping,
Eleven Pipers Piping,
Twelve Drummers Drumming,"-split'\n'
$i=0
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{
    "On the $_ day of Christmas"
    "My true love sent to me"
    $song[$i++..0]
    ""
}



# 462: encoding for 'ing,'

$n="ing,"
$song="A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Lay$n
Seven Swans-a-Swimm$n
Eight Maids-a-Milk$n
Nine Ladies Danc$n
Ten Lords-a-Leap$n
Eleven Pipers Pip$n
Twelve Drummers Drumm$n"-split'\n'
$i=0
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{
    "On the $_ day of Christmas"
    "My true love sent to me"
    $song[$i++..0]
    ""
}



# 436: inline song and remove indent

$n="ing,"
$i=0
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{
"On the $_ day of Christmas"
"My true love sent to me"
("A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Lay$n
Seven Swans-a-Swimm$n
Eight Maids-a-Milk$n
Nine Ladies Danc$n
Ten Lords-a-Leap$n
Eleven Pipers Pip$n
Twelve Drummers Drumm$n"-split'\n')[$i++..0]
""
}



#430 move the newline

$n="ing,"
$i=0
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{"On the $_ day of Christmas
My true love sent to me"
("
A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Lay$n
Seven Swans-a-Swimm$n
Eight Maids-a-Milk$n
Nine Ladies Danc$n
Ten Lords-a-Leap$n
Eleven Pipers Pip$n
Twelve Drummers Drumm$n"-split'\n')[++$i..0]}







# 425: almost final, remove $i
Remove-Variable i

$n="ing,"
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{"On the $_ day of Christmas
My true love sent to me"
("
A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Lay$n
Seven Swans-a-Swimm$n
Eight Maids-a-Milk$n
Nine Ladies Danc$n
Ten Lords-a-Leap$n
Eleven Pipers Pip$n
Twelve Drummers Drumm$n"-split'\n')[++$i..0]}



# 424: Final, remove newline in split

$n="ing,"
echo First Second Third Fourth Fifth Sixth Seventh Eighth Ninth Tenth Eleventh Twelfth|%{"On the $_ day of Christmas
My true love sent to me"
("
A Partridge in a Pear Tree.
Two Turtle Doves, and
Three French Hens,
Four Calling Birds,
Five Gold Rings,
Six Geese-a-Lay$n
Seven Swans-a-Swimm$n
Eight Maids-a-Milk$n
Nine Ladies Danc$n
Ten Lords-a-Leap$n
Eleven Pipers Pip$n
Twelve Drummers Drumm$n"-split'
')[++$i..0]}