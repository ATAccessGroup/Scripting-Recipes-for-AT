;Script to filter mouse presses (L&R button) on a certain part of the screen

;Set the height which you want to block where is says ypos>=... - note, this is measured from the TOP.


LButton::
mousegetpos, xpos, ypos

if ypos>=600
{
	Click, Left
	return
}
else
	return


RButton::
mousegetpos, xpos, ypos

if ypos>=600
{
	Click, Right
	return
}
else
	return
