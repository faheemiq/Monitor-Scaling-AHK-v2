Persistent ; Script continually runs
#SingleInstance force ; If script is run a second time, it restarts the instance already running

DetectHiddenWindows true
; Allows you to hide the CMD window. If you won't be hiding your CMD window, then no need to add this line.

SetRegView 64
; Sets the registry view used by RegRead, allowing it in a 32-bit script to access the 64-bit registry view and vice versa.

Pause:: ; the toggle key
{
    RunWait(A_ComSpec . " /c " . A_WinDir . "\System32\DpiScaling.exe") ; launch Settings -> Display
    CurrentDPI := RegRead("HKEY_CURRENT_USER\Control Panel\Desktop\PerMonitorSettings\CMN153B0_2A_07E4_21^007854C671615D991A7F59821F1C5461", "DpiValue") ; Determine the current scaling setting.

    Sleep 2000 ; Time to wait in milliseconds for the Display Settings window to appear
    if (CurrentDPI = 4294967295) ; Setting of 100%
    {
        Send("{Tab 22}{Down 1}") ; Tab key is pressed 22 times and then Down Arrow
        Sleep 3000 ; Time to wait in milliseconds so tabbing can be done correctly
        Send("!{F4}") ; Close the Display Settings window
        return
    }
    else if (CurrentDPI = 0) ; Setting of 125%
    { 
        Send("{Tab 22}{Up 1}") ; Tab key is pressed 22 times and then Up Arrow
        Sleep 3000 ; Time to wait in milliseconds so tabbing can be done correctly
        Send("!{F4}") ; Close the Display Settings window
        return
    }
    else
    {
        MsgBox("Current Scaling DPI is neither 100% nor 300%. The current value is " . CurrentDPI . ".") ; 100% = 0, 125% = 1, 150% = 2, 175% = 3, 200% = 4, 225% = 6, and so on.
        return
    }
}
