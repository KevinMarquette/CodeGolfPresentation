<#
A quine is a non-empty computer program which takes no input and produces a copy of its own source code as its only output. Produce such a program.

Trailing whitespace is NOT stripped from the output for this hole. (Consequently, if your submission doesn't pass, try adding a line break at the end.)
#>

# 31
.($a={".(`$a={$a})"|Out-Host})

# 25
.($a={".(`$a={$a})"|oh})

# discord

Cory — Yesterday at 10:55 AM
🤔 there isn't a shorter way to do write-host -nonewline than write-host -n is there?
HCRitter — Yesterday at 11:00 AM
As [console]::write() shouldn’t be shorter, yeah..
santi — Yesterday at 11:00 AM
unless you assign an alias to it then i think thats right
Console is different
HCRitter — Yesterday at 11:01 AM
Thinking of echoing with write output and special chars.. like „\br“ etc..
Thing is, we are talking code golf, right? 
Never had to use write-host there
Cory — Yesterday at 11:03 AM
yeah, this is code golf. The quine hole needs to use either out-host or write-host...
it is irritating
HCRitter — Yesterday at 11:04 AM
Hey code golf, this is me, Christian
Cory — Yesterday at 11:04 AM
if I add a newline and remove  -n I end up with the same character cound as Kevin, but it doesn't work 😬
HCRitter — Yesterday at 11:04 AM
Jon would be so proud of me
santi — Yesterday at 11:04 AM
$Host.UI.Write() would be shorter but still, they're very different from Write-Host
HCRitter — Yesterday at 11:05 AM
Dunno if I solved it already
Cory — Yesterday at 11:06 AM
nope https://code.golf/quine#powershell
Image
Quine
Write a non-empty program to produce its own source code.
Image
santi — Yesterday at 11:12 AM
i dont understand what they're asking 🤣
is it gc $PSCommandPath ?
chrisdent — Yesterday at 11:14 AM
no, it's not saved to a file, tried that 😉
santi — Yesterday at 11:14 AM
lol
so $MyInvocation.MyCommand.ScriptBlock ?
chrisdent — Yesterday at 11:14 AM
you can drop .ScriptBlock
santi — Yesterday at 11:15 AM
how so?
chrisdent — Yesterday at 11:15 AM
$MyInvocation.MyCommand is enough ToString'd
I can get 29 chars, but I'm going to lose interest soon 😄
santi — Yesterday at 11:16 AM
ahhh cause Write-Host will stringify it
right
such a waste of time
chrisdent — Yesterday at 11:17 AM
yeah.
was just curious. Giving up at 29 because there's just no real need 😄
santi — Yesterday at 11:18 AM
is there any need for code golf?
other than wasting time
chrisdent — Yesterday at 11:19 AM
not really 😄 27... dunno how IISResetMe got it down to 21, let alone the 17 at the top of the board
santi — Yesterday at 11:21 AM
you could bribe him 😛
chrisdent — Yesterday at 11:22 AM
nah, I think I have 21 now
santi — Yesterday at 11:22 AM
😮
chrisdent — Yesterday at 11:22 AM
well almost, it's telling me it differs while showing me a diff with exactly the same content
santi — Yesterday at 11:23 AM
perhaps line trail?
its gotta use -nonewline according to that thing
chrisdent — Yesterday at 11:24 AM
doesn't seem to be, but it's soon going in "meh"
yeah, Write-Host is too long
santi — Yesterday at 11:26 AM
was thinking &(gcm w*-h*)
but thats def not shorter
chrisdent — Yesterday at 11:26 AM
too long
oh is the way to go I'm sure
santi — Yesterday at 11:27 AM
god, wth am i doing wasting tiume with this 🤣
lol
chrisdent — Yesterday at 11:27 AM
yeah, gotta stop looking at this 😄
santi — Yesterday at 11:31 AM
did you solve it yet chris? 🤣
fffffffffff
chrisdent — Yesterday at 11:32 AM
no, stopped 🙂
jborean — Yesterday at 11:35 AM
Considering some are 17 chars I think it rules out $MyInvocation.MyCommand at least directly
santi — Yesterday at 11:39 AM
i dont know any other way you could dynamically reference itself
chrisdent — Yesterday at 11:39 AM
I think it's the right thing to use, you just have to use a shorter way to get there
santi — Yesterday at 11:40 AM
this kind of bs maybe (gv -v m*n).MyCommand
seeminglyscience — Yesterday at 11:40 AM
gv m*n -v|% m*d
santi — Yesterday at 11:40 AM
jesus
why
chrisdent — Yesterday at 11:40 AM
y4ou can lose the n and the d
but  that's basically where mine is now 😉
I jsut can't be bothered to figure out why it says no to my variant
jborean — Yesterday at 11:47 AM
I can't even break the 20s
no newline is killing me
santi — Yesterday at 11:48 AM
20s?
chars?
jborean — Yesterday at 11:49 AM
I mean I can't get below 30
31 actually
santi — Yesterday at 11:49 AM
gv m*n -v|% m*d|&(gcm)[-6]-n is the shortest i can get
chrisdent — Yesterday at 11:50 AM
gv m* -v is fine
% m* is fine
jborean — Yesterday at 11:51 AM
ok so 26 now 🙂
chrisdent — Yesterday at 11:51 AM
I stand by oh being the way to go, but while I can get 21, I can't get it to accept it or tell me what differs
jborean — Yesterday at 11:52 AM
won't you always have to deal with the newline with oh?
because there's no -NoNewLine option for that cmdlet
chrisdent — Yesterday at 11:52 AM
diff says they're the same, so it's kind of unclear
jborean — Yesterday at 11:52 AM
hmm maybe if my script has a newline?
HCRitter — Yesterday at 11:53 AM
Dang.. can we talk schnitzel again instead? Hadn’t tackled this one so far but like the |% m*d a lot
jborean — Yesterday at 11:59 AM
23 now
21, tied with the great IISResetMe
I also don't know why Out-Host doesn't like it considering the diff output is the same
Annoying that implicit output isn't there
jborean — Yesterday at 12:09 PM
Just need to figure out a slimmer way to write to the host than santi's example
santi — Yesterday at 12:13 PM
@IISResetMe im sure you'll like this https://www.youtube.com/watch?v=ptKjWPC7pqw
YouTube
dotnet
Deep Dive into RegEx with Stephen Toub
Image
these series are awesome
jborean — Yesterday at 12:51 PM
Gah why is Write-Host not aliased! The one time I want builtin aliases 
Well I have no idea why it now works but am on 18
jborean — Yesterday at 1:04 PM
That 1 char is going to kill me
jborean — Yesterday at 1:11 PM
just an FYI chrisdent, oh works but you just need to have the trailing newline in the code itself
chrisdent — Yesterday at 1:12 PM
ah it's the little things...
jborean — Yesterday at 1:12 PM
I thought I tried it before but obviously not
chrisdent — Yesterday at 1:12 PM
I thought I tried that. Obviously did it wrong
jborean — Yesterday at 1:12 PM
jinx
IISResetMe — Yesterday at 2:07 PM
Is it the quine ⛳? 😅
jborean — Yesterday at 2:07 PM
yea
Just 1 char short from the top now but I'm at a loss
Just need Out-Host to ToString() an object so I don't have to 🙂 
IISResetMe — Yesterday at 2:12 PM
Nice
Just shaved off another 2
jborean — Yesterday at 2:13 PM
Are you using some form of $MyInvocation or another thing to get the data. I'm using something else but wondering if there's a 3rd even shorter way
santi — Yesterday at 2:16 PM
what else aside from my invocation can get you that info if the script isnt saved?
jborean — Yesterday at 2:16 PM
a certain stack
IISResetMe — Yesterday at 2:16 PM
Yeah, I'm grabbing $MyInvocation.Line
jborean — Yesterday at 2:17 PM
Well I may as well just share what I have

gcs|% P*|% To*|oh

The trailing newline is needed for out-host
santi — Yesterday at 2:17 PM
thats cheat! lol
IISResetMe — Yesterday at 2:18 PM
Nope, it's a quine 😄
jborean — Yesterday at 2:18 PM
It can be To* or Te* as both result in the same value and is unfortunately why it needs the 2nd char 
santi — Yesterday at 2:19 PM
so maybe this could be "$(gcs|% P*)"|oh ?
im not sure
this things just lose my interest
jborean — Yesterday at 2:20 PM
unfortunately no
because the value is for the substring expression not the whole thing
santi — Yesterday at 2:20 PM
ahhh because expansion
gotcha
IISResetMe — Yesterday at 2:22 PM
I'm gonna give you 5 minutes before updating my own solution 😉
Image
jborean — Yesterday at 2:22 PM
sigh
I did that for Text but didn't think of the other 😛
bam and the dirt is gone
update away!
santi — Yesterday at 2:23 PM
hehe  cause the *g 
thats clever
Cory — Yesterday at 2:45 PM
IMHO the diffing would be so much better if it showed the line ending characters. There's so many I had where it didn't like it, but the diff said it was the same, and I'm sure it's line endings or something...
or lack of them, and it just pads them?
Matej — Today at 8:27 AM
kinda wondering now why GetPSCallStack even has an alias
I mean, it's not like you use that command every day
or every month, even
chrisdent — Today at 8:28 AM
seeing that last night I very much suffered from "wth is that command"
jborean — Today at 8:29 AM
they knew there will be a quine code golf
James — Today at 2:03 PM
I had to take a break from Code Golf after I made this. I would love to talk about someone's solution to N-Queens. Speed in C# was fine, speed in PowerShell was... really bloomin' annoying. I haven't really solved it, just got "good enough" by short-circuiting.
Image
KevMar — Today at 2:25 PM
Now that you beat me, here was my 31 char solution .($a={".(`$a={$a})"|Out-Host})
I might have to collect all these attempts for next years session 🙂


# 18
gcs|% P*|% To*|oh

#17
gcs|% P*|% *g|oh

(variable).name[28]
(variable).value[28]
(variable|% va*)[28]
$MyInvocation|% M*|% D*|oh

# 37
$MyInvocation|% M*|% D*|write-host -n

# 39
variable my* -V|% m*|% D*|write-host -n
variable -V



# 25
.($a={".(`$a={$a})"|oh})
