; Keyboard Debouncer -- by debouncer
; http://www.autohotkey.com
; This script addresses a problem in some laptops where the keyboard
; "bounces", resulting in doubled keystrokes (sometimes tripled in
; really bad cases). Because the keystrike repeat is usually very
; fast, it can be detected and filtered out. The filter window is
; set by the first command-line argument, in milliseconds. (If left
; blank, it defaults to 40 msec.) Set it longer for better filtering
; of bounces, but just shorter than your desired auto-repeat rate.
;
; All primary keys are bounce-filtered with their shifts, but not their
; Alt, Ctrl, or Win variants (feel free to add them if you really need
; to have them). The num-keypad keys are also not filtered.  All
; movement keys (including Enter, BS, Del, Esc) are filtered with no
; variants. Shift, Ctrl, Alt and Win are not filtered. Keys that are
; not filtered are passed through (i.e. no hotkeys are assigned to
; them).
; Credit goes to Jon for his KeyboardOnScreen script, where I learned
; the handy trick of assigning hotkeys from the ASCII table in a loop.


; ---- setups
#UseHook On
;Capslock::LShift


; ---- initialize parameters
if (%0% > 0)
	k_TimeThreshold = %1%
else
	k_TimeThreshold = 40
;k_TimeThreshold = 1000  ; for debugging


; ---- initialize variables
k_LastHotkey = 0
k_LastTick := A_TickCount


; ---- Set all keys as hotkeys. See www.asciitable.com
k_ASCII = 33
Loop
{
	Transform, k_char, Chr, %k_ASCII%

	Hotkey, %k_char%, k_KeyPress

       	if ((k_char Not In +,^)  AND  (k_ASCII != 123  AND k_ASCII != 125))
	{
		Hotkey, +%k_char%, k_KeyPress		; shift
		; Hotkey, ^%k_char%, k_KeyPress		; control
		; Hotkey, !%k_char%, k_KeyPress		; alt
		; Hotkey, #%k_char%, k_KeyPress		; win
	}

	if k_ASCII = 64
		k_ASCII = 91
	else if k_ASCII = 126
		break
	else
		k_ASCII++
}
return 

; ---- End of auto-execute section.


; ---- When a key is pressed by the user, send it forward only if it's not a "bounce"
; ---- A "bounce" is defined as: "key is same as last"  AND  "time since last key is very short"
Enter::
Space::
Tab::
Esc::
BS::
Del::
Ins::
Home::
End::
PgUp::
PgDn::
Up::
Down::
Left::
Right::
k_KeyPress:
{
	k_ThisHotkey := A_ThisHotkey		; grab the current hotkey
	k_ThisTick := A_TickCount		; grab the current tick
	ElapsedTime := k_ThisTick - k_LastTick	; time since last hotkey (ticks)

	if (ElapsedTime > k_TimeThreshold  ||  k_ThisHotkey <> k_LastHotkey)
	{
		if k_ThisHotkey In !,#,^,+,{,},Enter,Space,Tab,Esc,BS,Del,Ins,Home,End,PgUp,PgDn,Up,Down,Left,Right
			SendInput {%k_ThisHotkey%}
		else
			SendInput %k_ThisHotkey%
		;SendInput %ElapsedTime%  ; for debugging
	}

	k_LastHotkey := k_ThisHotkey	; store the current hotkey for next time
	k_LastTick := k_ThisTick	; store the current tick for next time
}
return

; ---- other keys that could be filtered (but caused issues on some keyboards)
;LWin::
;RWin::
;LAlt::
;RAlt::