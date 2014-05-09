#SingleInstance Force
#Persistent
#NoEnv
SetTitleMatchMode, 2
SizeOfMovement=50 ; in pixels
TimeToPoll=10 ; ms - Time to Poll. 

Loop
{
/*
IfWinNotActive, Notepad ; Thus we only ever use this behavior in Notepad
   {
   Sleep 500 ; Optional. I don't know if this has any positive effect on script performance.
   Continue
   }
*/
MouseGetPos, VarX1, VarY1
Sleep TimeToPoll
MouseGetPos, VarX2, VarY2
VarX:=VarX1-VarX2
VarY:=VarY1-VarY2

If(VarX>SizeOfMovement) ; if VarX1 was greater than VarX2, and that difference is greater than 50
Send {Left}
If(VarX<-SizeOfMovement)
Send {Right}
If(VarY>SizeOfMovement)
Send {Up}
If(VarY<-SizeOfMovement)
Send {Down}
}
return 

Ins::ExitApp
