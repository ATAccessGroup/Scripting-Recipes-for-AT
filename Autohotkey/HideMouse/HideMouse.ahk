#SingleInstance force
#Persistent

; Tray Menu functions. I hope people use this.
menu, tray, add ; separator
menu, tray, add, Help

; Main 
Help:
    HelloText =
    (
    Toggle the mouse cursor on/off. Might be useful for eyegaze. Might not be. 
    Please remember the toggle code! Its control+M (Shift M)
    )
    MsgBox, %HelloText%
return

^+M::
    MsgBox, Cursor being toggled.
	SystemCursor(-1)
return


SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
   static AndMask, XorMask, $, h_cursor
      ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13  ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13  ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13  ; handles of default cursors
   if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
   {
      $ = h                                           ; active default cursors
      VarSetCapacity( h_cursor,4444, 1 )
      VarSetCapacity( AndMask, 32*4, 0xFF )
      VarSetCapacity( XorMask, 32*4, 0 )
      system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
      StringSplit c, system_cursors, `,
      Loop %c0%
      {
         h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
         h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
         b%A_Index% := DllCall("CreateCursor","uint",0, "int",0, "int",0
                             , "int",32, "int",32, "uint",&AndMask, "uint",&XorMask )
      }
   }
   if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
      $ = b       ; use blank cursors
   else
      $ = h       ; use the saved cursors

   Loop %c0%
   {
      h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
      DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
   }
}