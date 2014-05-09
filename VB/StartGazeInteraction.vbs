
Set WshShell = WScript.CreateObject("WScript.Shell")
App_Path = "C:\Program Files\Tobii\Gaze Interaction\TobiiEyeControlOptions.exe"
WshShell.Run "CMD /C CD ""\Program Files\Tobii\Gaze Interaction\"" & """ & App_Path & """"
