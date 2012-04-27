#SingleInstance force
;read in vars.
IniRead, k_TimeThreshold, OneSwitchTwoActions.ini, OneSwitchTwoActions, debounceTime, 50
IniRead, LongPress, OneSwitchTwoActions.ini, OneSwitchTwoActions, LongPressTime, 800
IniRead, KeyShortChar, OneSwitchTwoActions.ini, OneSwitchTwoActions, KeyShortCharToSend, Space
IniRead, KeyLongChar, OneSwitchTwoActions.ini, OneSwitchTwoActions, KeyLongCharToSend, Enter
IniRead, KeyToDetect, OneSwitchTwoActions.ini, OneSwitchTwoActions, KeyToDetect, Space

Hotkey, $%KeyToDetect%, detectOneOrTwo 
return

detectOneOrTwo:
    StartTime := A_TickCount
    Loop
    {
        ElapsedTime := A_TickCount - StartTime
        if (ElapsedTime > LongPress) {
            break
        } 
        if not GetKeyState(KeyToDetect, "P")  
            break 
    }
    
    ;debounce may not work
    if (ElapsedTime > k_TimeThreshold){
    if (ElapsedTime < LongPress)
    {
        ; Short key
        Send {%KeyShortChar%}
    } else {
        ; Long key
        Send {%KeyLongChar%}
    }
    }
    return