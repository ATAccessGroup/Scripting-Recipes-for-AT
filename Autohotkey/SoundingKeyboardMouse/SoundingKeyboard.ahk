; AHK file for Emulating Sounding Keyboard & Mouse
; Simply pop your keyboard sounds in My Documents\KeySounds 
; An example series of sounds : http://www.theblog.ca/mp3-audio-files-alphabet 
; http://code.willwa.de

#Persistent 
#SingleInstance force

HelloText =
(
Sounding Keyboard
WillWa.de  

A small app designed to play keyboard sounds (a-z and 1-9) when a key is pressed. 
Useful with keyboard practice and learning

To use. Place letter sounds (named [key].wav where [key] is the letter - e.g. 1.wav, 4.wav, k.wav, p.wav etc..) in your My Documents/KeySounds folder. 

To pause the app press control+s or find the icon in the bottom task bar, right click - pause script

NB: only letters and numbers. Beeps on any letters it can't find a sound file for.
)
MsgBox, %HelloText%

; Letters
Loop, 26
  Hotkey, % Chr(Asc("a") + A_Index - 1), MyLabel

; Numbers
Loop, 10
   Hotkey, % A_Index - 1, MyLabel
return

MyLabel:
    Hotkey, %A_ThisHotkey%, Off
        Send %A_ThisHotkey%
    Hotkey, %A_ThisHotkey%, MyLabel
    SoundPlay, %A_MyDocuments%\KeySounds\%A_ThisHotkey%.wav
    ifNotExist, %A_MyDocuments%\KeySounds\%A_ThisHotkey%.wav
    {
        SoundPlay *-1 
    }
return
