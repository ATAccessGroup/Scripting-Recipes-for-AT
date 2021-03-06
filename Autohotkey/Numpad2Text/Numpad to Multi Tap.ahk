; Marcus Friday
#SingleInstance force
Mods = ^!+#

;to speak with Grid2 second keyboard switch set to 'speak sentence' not working properly - and will need to use different keys - awaiting grid2 update 2.7 
;NumpadIns::F2

;when num lock off NumpadIns sends ctrl c to copy and NumpadDel to paste
NumpadIns::^c
NumpadDel::^v

;when num lock off NumpadClear (key5) send shift and arrow up to select previous line  - should work in textchat workspace and word doc
NumpadClear::+Up

Numpad7::KeyBD("()[]1")
Numpad8::KeyBD("ABC2@")
Numpad9::KeyBD("DEF3#")
Numpad4::KeyBD("GHI4$")
Numpad5::KeyBD("JKL5%")
Numpad6::KeyBD("MNO6^")
Numpad1::KeyBD("PQRS7&")
Numpad2::KeyBD("TUV8~")
Numpad3::KeyBD("WXYZ9'")
Numpad0::KeyBD(" +-*/\0")
NumpadDot::KeyBD(".,?!")
NumpadDiv::          ; Cmd mode with Ctrl/Alt/Shift/Win sticky keys
   If (A_ThisHotKey = A_PriorHotKey and A_TimeSincePriorHotkey < 1000)
   {
      StringTrimRight Mod, Mod, 1
      ModI++         ; index of next modifier, wrapped around
      IfGreater ModI,4, SetEnv ModI,1
   }
   Else ModI = 1     ; first modifier from list
   StringMid m, Mods, ModI, 1
   Mod = %Mod%%m%
   c =               ; clear char
   ModTip(Mod,c)
Return
NumpadMult::         ; TAB (multi letter key name, no cycle)
   IfEqual Mod,, Send {Tab}
   Else {
      c = {TAB}
      ModTip(Mod,c)
   }
Return
NumpadSub::          ; BackSpace
   IfEqual Mod,, Send {BackSpace}
   Else {
      IfEqual c,, StringTrimRight Mod, Mod, 1
      Else c =
      ModTip(Mod,c)
   }
Return
NumpadAdd::          ; ~CapsLock
   Caps:=!Caps
   TrayTip,,Caps = %Caps%
Return
$NumpadEnter::       ; Enter /  Execute commnad
   IfEqual Mod,, Send {Enter}
   Else {
      Send %Mod%%c%
      Mod =          ; Exit cmd mode
      TrayTip
   }
Return

KeyBD(list)
{
   Static i          ; index of the character in the list, to be sent
   Global Caps, Mod, c
   If (A_ThisHotKey = A_PriorHotKey and A_TimeSincePriorHotkey < 1500)
   {
      IfEqual Mod,,Send {BS} ; erase the char this key has inserted
      i++            ; index of next char, wrapped around
      IfGreater i,% StrLen(list), SetEnv i,1
   }
   Else i = 1        ; at new key send first char from list
   StringMid c, list, i, 1
   IfEqual Mod,, {
      IfEqual Caps,1, StringUpper c,c
      Else            StringLower c,c
      SendRaw %c%    ; send selected
   }
   Else {
      StringLower c,c
      ModTip(Mod,c)
   }
}

ModTip(s,c)
{
   StringReplace s, s, ^, Ctrl-, All
   StringReplace s, s, !, Alt-,  All
   StringReplace s, s, +, Shift-,All
   StringReplace s, s, #, Win-,  All
   TrayTip,,Cmd = %s%%c%
}


