Const HKEY_CURRENT_USER = &H80000001
strComputer = "."
Set objRegistry = GetObject("winmgmts:\\" & strComputer & "\root\default:StdRegProv")
strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings"
strValueName = "ProxyEnable"
objRegistry.GetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, dwValue
if dwValue=0 then
	dwValue=1
else
	dwValue=0
end if
objRegistry.SetDWORDValue HKEY_CURRENT_USER, strKeyPath, strValueName, dwValue
if dwValue=1 then
    strValueName = "ProxyServer"
    strValue = "10.33.172.51:8080"
    objRegistry.SetStringValue HKEY_CURRENT_USER, strKeyPath, strValueName, strValue
    strValueName = "ProxyOverride"
    strValue = "<local>"
    objRegistry.SetStringValue HKEY_CURRENT_USER, strKeyPath, strValueName, strValue
	msg="ORS Proxy Enabled"
else
	msg="ORS Proxy Disabled"
end if
msgbox msg,64,"Proxy Toggle"
