#Music Player/Shortcutter#

![](https://github.com/willwade/Scripting-Recipes-for-AT/raw/master/Autohotkey/MusicSwitcher/switchMusicThumb.png)

This is a little Windows system tray app to develop/assess switch skills with music on a standard Windows computer. When assessing switch skills we often want to look a number of aspects; cause & effect, timed and two-switch. Playing music (along with a game such as Musical Statues) can be a great way to assess this. There are quite a few ways of doing this with the right equipment, for example a [powerlink](http://www.inclusive.co.uk/powerlink-4-uk-p2575) and tape player is the classic (reliable?!) way - or using one of the [iPod](http://www.inclusive.co.uk/ipod-switcher-p2554) [switching](http://www.inclusive.co.uk/hook-ipod-switch-access-p5960) boxes that suppliers now sell. However if you are out on an assessment and of these bits of kit is failing you or that mp3 file is stuck on a computer you can use this little tool. 
 
(For more information on developing switch skills take a look at [Ian Bean's free book available from Inclusive](http://www.inclusive.co.uk/articles/switch-progression-road-map) or the [documentation available at ACE North](http://www.ace-north.org.uk/pages/resources/documents/DevelopingSwitchingSkills.pdf) for starters) 

##To use:##

1. Download it [here](https://s3-eu-west-1.amazonaws.com/app-musicswitcher/MusicSwitchShortCutter.zip). Unzip it. Feel free to run it from your desktop or wherever - even a USB stick will do.
2. Get your music ready in iTunes, Windows Media Player or VLC. Open one of those apps. Don’t have both running. (NB: It doesn’t need to be in the foreground so you can do other things with other switches if needed). Note too that this works with video equally as well as music files. 
3. Configure your switch driver software (e.g. [this](http://www.sensorysoftware.com/switchdriver.html))  to convert the correct switch presses to the correct keys:

##Some suggestions:##

- *Timed play with 1 switch* Configure switch to F8 or 0. Configure time by pressing Control+Shift+C (Default time is 8 Seconds). If you want to check what time is set: Control+Shift d
- *Latching with 1 switch* Configure switch to F7 or 1
- *Two switch Play/Stop* Configure Play switch to F3 or Left Arrow and Stop switch to F4 or Down Arrow
- *Two switch Play/Next* Configure Play switch to F3 or Left Arrow and Next switch F6 or 3

###Caveats:###

- It will stop any previous use of F keys whilst running. Just right click on the taskbar icon to exit the application.
- If WMP or iTunes is already playing when you make the first switch hit, or you manually hit press/play after the first hit is made then you may find everything gets reversed! (i.e. Play becomes Stop!). 

###The full shortcuts are:###

    F8 or 0 or ctrl-shift t : Play music for timed period (default 8 secs)
    Ctrl-Shift c : Config window to set the time
    Ctrl-Shift d : View the time period set
    
    F3 or Left Arrow or Ctrl-Shift f : Play (not toggle)
    F4 or Down Arrow or Ctrl-Shift s : Stop (not toggle)
    
    F5 or 1 Ctrl-Shift [ : Previous
    F7 or 2 or ctrl-shift p : Play / Pause toggle
    F6 or 3 or Ctrl-Shift ] : Next
    
    Ctrl-Shift - : Vol down
    Ctrl-Shift = : Vol up
    
    Ctrl-Shift h : This help box

###Developer Notes###

The code is written rather quickly in [AutoHotKey](http://www.autohotkey.com/) by [will wade](http://willwa.de) you can take a look at the [source code here](https://github.com/willwade/Scripting-Recipes-for-AT/tree/master/Autohotkey/MusicSwitcher) and you are more than welcome to fork the code and adapt for your own needs. (with thanks to [this thread](http://www.autohotkey.com/community/viewtopic.php?t=23267))

There are some other scripts available on GitHub in this sub-project; Notably Play and Stop Windows Media Player. These were hacked together by Marcus Friday. 

Free to use with Credit. Please consider forking back to this project if you make changes. 