jjo#JoySwitch#

Need a joycable interface for Tobii Communicator but don't have one (/only have a keyboard emulator type switch box)? Then you need me!

## What does this do? ##
Some applications need/require a switch interface but are looking for a joystick interface. Such applications include Tobii Communicator and using a switch to select for eyegaze. (Tobii Communicator can use a range of other switch actions for scanning but not eyegaze selection.)

## How to use it ##

1. Download and install [vJoy](http://sourceforge.net/projects/vjoystick/files/latest/download) (You don't need the "feeder application" when you install it)
3. Download the [JoySwitch application](https://s3-eu-west-1.amazonaws.com/script-exes/JoySwitch.exe)
4. Double Click! To exit the application right click on the little umbrella in your tool bar and click "exit"
5. Map your switch box to 0 for your single switch (1,2 are second and third switches if you should need them)
6. Put it in your start-up items 

## If you want to edit this ##

1. Download the AHK file from this repo above.
2. Download the [AHK vJoy Wrapper](https://github.com/evilC/AHK-Universal-Joystick-Remapper) - so and place the JoySwitch AHK file in the folder above the vJoyLib directory..
3. Run or compile with the AHK compiler 

## What if I want to do the opposite? E.g. convert joystick button to key press? ##

You may want to do this on a Liberator/PRC device and use the switch ports for something other than their software. You can do this simply with a autohotkey script e.g

``Joy5::Space``

and make your autohotkey app run at startup

## With thanks to ##

[Visual Pharm for the icon](https://www.iconfinder.com/icons/66425/umbrella_icon#size=128), evilC for the Wrapper and the vJoy Project



