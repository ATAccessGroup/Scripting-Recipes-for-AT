$esc::
KeyWait esc, t0.5
if errorlevel
   {
   WinGetTitle, Title, A
   If Title contains Mozilla Firefox, Excel, Notepad++
      send, ^w
   Else
      winclose, %title% 
   }
Else
   send {escape}
KeyWait esc
Return