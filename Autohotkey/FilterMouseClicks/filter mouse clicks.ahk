; Marcus Friday
;Script to filter mouse presses (L button)
LButton::
SetTimer, filter, 800
return

filter:
SetTimer, filter, off
GetKeyState, state, LButton, P
if state = U
	return
else
	Click
