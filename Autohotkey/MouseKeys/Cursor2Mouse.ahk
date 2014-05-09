#SingleInstance Force
#Persistent
#NoEnv
SetBatchLines, -1
SetDefaultMouseSpeed, 0
SetMouseDelay, 2 ;Change this number here to control the mouse speed. (the lower the number the faster the mouse speed & the higher the number the slower the mouse speed)

Up::
Key = Up
X = 0
Y = -1
Goto, Move_Mouse

Down::
Key = Down
X = 0
Y = 1
Goto, Move_Mouse

Left::
Key = Left
X = -1
Y = 0
Goto, Move_Mouse

Right::
Key = Right
X = 1
Y = 0
Goto, Move_Mouse



Move_Mouse:
Loop
	{
		MouseMove, %X%, %Y%, , R
		GetKeyState, State, %Key%, P
		If State = U
			Break
	}
Return