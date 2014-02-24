; VJoy_TestSimple.ahk

	OnExit, ExitSub
 
#include %A_ScriptDir%\VJoyLib\VJoy_lib.ahk

	; for Notepad++ debugging
/*
	SetWorkingDir, %A_ScriptDir%
*/

	EnvGet, pgpath, ProgramFiles
	pgpath .= "\vJoy\vJoyInterface.dll"
	if (DLLCall("LoadLibrary", "Str", pgpath )) {
	}

    iInterface := 1
    mydev := VJoy_Init(iInterface)
    if (!VJoy_Ready(iInterface)) {
        MsgBox, Device %iInterface% not ready.
        VJoy_Close()
        ExitApp
    }
    ToolTip, Device %iInterface% ready!
    SetTimer, ttoff, 2000
return

ttoff:
    ToolTip
    SetTimer, ttoff, Off
return

Joy1::
    ;SendVJoyBtn(1)
    ToolTip, Joy1
    SetTimer, ttoff, 2000
return

; Simple off->ON test
0::SendVJoyBtn(1)
1::SendVJoyBtn(2)
2::SendVJoyBtn(3)
return


SendVJoyBtn(btnid) {
    Global iInterface

    if (btnid < 1 or btnid > VJoy_GetVJDButtonNumber(iInterface)) {
        MsgBox, Invalid button id!
        return
    }
    VJoy_SetBtn(1, iInterface, btnid)   ; Press button
    Sleep, 100
    VJoy_SetBtn(0, iInterface, btnid)   ; Release button
}

F12::
    VJoy_Close()
    reload
return

ExitSub:
    VJoy_Close()
	ExitApp
