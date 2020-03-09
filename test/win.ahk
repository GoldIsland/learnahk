Run Notepad
WinWait Untitled - Notepad
WinActivate  ; Uses the last found window.

IfWinExist, Untitled - Notepad
{
    WinActivate  ; Automatically uses the window found above.
    WinMaximize  ; same
    Send, Some text.{Enter}
    return
}

IfWinNotExist, Calculator
    return
else
{
    WinActivate  ; The above "IfWinNotExist" also set the "last found" window for us.
    WinMove, 40, 40  ; Move it to a new position.
    return
}