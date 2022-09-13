set seekFlag to display dialog "What text to seek for?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
set toArm to display dialog "What would you like to do?" buttons {"Arm","Disarm"} default button "Arm"

set shouldArm to false

if toArm equals "Arm" then
set shouldArm to true
else
set shouldArm to false
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

set cuesChanged to 0

tell application id "com.figure53.QLab.4"
	set ShowCueList to selected of front workspace
	repeat with eachCue in ShowCueList
		try
			if q name of eachCue contains seekFlag then
				set armed of eachCue to shouldArm
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
