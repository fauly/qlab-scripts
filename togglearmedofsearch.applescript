set search to display dialog "What text to seek for?" default answer "" with icon note buttons {"Arm", "Disarm"} default button "Arm"
set shouldArm to button returned of search
set seekFlag to text returned of search

if shouldArm is equal to "Arm" then
	set arming to true
else
	set arming to false
end if

tell application id "com.figure53.QLab.4"
	set current cue list of front workspace to the first cue list in front workspace whose q name is "Show"
	activate
end tell

tell application "System Events"
	key code 125 using command down
	keystroke ">" using shift down
	keystroke "a" using command down
end tell

delay 0.5

set cuesChanged to 0

tell application id "com.figure53.QLab.4"
	set ShowCueList to selected of front workspace
	repeat with eachCue in ShowCueList
		try
			if q name of eachCue contains seekFlag then
				set armed of eachCue to arming
				set cuesChanged to cuesChanged + 1
			end if
		end try
	end repeat
	
	
	if cuesChanged is greater than 1 then
		display dialog "All done :)

There were " & cuesChanged & " cues changed!"
		
	else if cuesChanged is 0 then
		display dialog "Nothing altered. Perhaps try again?"
		
	else if cuesChanged is 1 then
		display dialog "All done :)

Only the " & cuesChanged & " cue was altered."
	end if
	
end tell

(* 

No, this is not the best way to do this. Yes, I am pretty rubbish.

If you have a smarter way to do this please let me know, i'm deadly curious how this should be done.

My name is Ryan and my number is 07762300489 

rcowley.com

*)

tell application "System Events"
	key code 53
end tell
