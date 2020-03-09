#SingleInstance,force
#WinActivateForce
/*
限制：windows XP系统适用

功能：给XP任务栏上打开的窗口定义热键


热键定义方式1：win+1-0切换前十个窗口
热键定义方式2：
CapsLock+1-4切换前1-4个窗口
CapsLock+q-r切换 第5-8个窗口
CapsLock+a-f切换 第9-12个窗口
CapsLock+z-v切换 第13-16个窗口

当前脚本是两种方式同时起作用的。


作者：sunwind
时间：原作品20090613，20151227稍加修改未优化
*/
Loop 10
{
	n := A_Index-1
	Hotkey, #%n%, Focus%n%
	Hotkey, #Numpad%n%, Focus%n%
}

Hotkey, CapsLock & 1,Focus1
Hotkey, CapsLock & 2,Focus2
Hotkey, CapsLock & 3,Focus3
Hotkey, CapsLock & 4,Focus4

Hotkey, CapsLock & q,Focusq
Hotkey, CapsLock & w,Focusw
Hotkey, CapsLock & e,Focuse
Hotkey, CapsLock & r,Focusr

Hotkey, CapsLock & a,Focusa
Hotkey, CapsLock & s,Focuss
Hotkey, CapsLock & d,Focusd
Hotkey, CapsLock & f,Focusf

Hotkey, CapsLock & z,Focusz
Hotkey, CapsLock & x,Focusx
Hotkey, CapsLock & c,Focusc
Hotkey, CapsLock & v,Focusv

return

test:
MsgBox %A_ThisHotkey%
return
Focus1:
FocusButton(1)
return
Focus2:
FocusButton(2)
return
Focus3:
FocusButton(3)
return
Focus4:
FocusButton(4)
return

Focus5:
Focusq:
FocusButton(5)
return
Focus6:
Focusw:
FocusButton(6)
return
Focus7:
Focuse:
FocusButton(7)
return
Focus8:
Focusr:
FocusButton(8)
return
Focus9:
Focusa:
FocusButton(9)
return
Focus0:
Focuss:
FocusButton(10)
return
Focusd:
FocusButton(11)
return
Focusf:
FocusButton(12)
return

Focusz:
FocusButton(13)
return
Focusx:
FocusButton(14)
return
Focusc:
FocusButton(15)
return
Focusv:
FocusButton(16)
return
#-::
#NumpadSub::
	ShowToolTips()
	SetTimer, RemoveToolTips, -1000
Return

RemoveToolTips:
	Loop, 10
		ToolTip,,,,%A_Index%
Return

ShowToolTips()
{
	global g_bundleCount
    Build_hWndArray(10)

	CoordMode, ToolTip, Screen
	Loop, %g_bundleCount%
	{
		If A_Index < 5
			continue
			
		x := g_xs%A_Index%
		y := g_ys%A_Index%
		If A_Index = 10
			text = 0
		Else
			text = %A_Index%
		
		ToolTip, %text%, %x%, %y%, %A_Index%
	}
}

Add_hWndToArray(gi, hWnd)
{
	global
	g_bundleSize%gi% := g_bundleSize%gi% + 1
	local wi := g_bundleSize%gi%
	g_hWnd%gi%_%wi% := hWnd	
}

AddBundle(gi)
{
	global
	g_bundleSize%gi% := 0
}

BundleSize(gi)
{
	global
	return g_bundleSize%gi%
}

Get_hWndFromArray(gi, wi)
{
	global
	return g_hWnd%gi%_%wi%
}

SetButtonTopLeftLoc(gi, x, y)
{
	global
	g_xs%gi% := x
	g_ys%gi% := y
}

Build_hWndArray(maxBundleCount)
{
	global g_bundleCount
	
	WinGet,	pidTaskbar, PID, ahk_class Shell_TrayWnd
	hProc := DllCall("OpenProcess", "Uint", 0x38, "int", 0, "Uint", pidTaskbar)
	pProc := DllCall("VirtualAllocEx", "Uint", hProc, "Uint", 0, "Uint", 32, "Uint", 0x1000, "Uint", 0x4)
	idxTB := GetTaskSwBar()
	SendMessage, 0x418, 0, 0, ToolbarWindow32%idxTB%, ahk_class Shell_TrayWnd ; TB_BUTTONCOUNT
	buttonCount := ErrorLevel
	
	g_bundleCount := 0
	
	Loop, %buttonCount%
	{
		SendMessage, 0x417, A_Index-1, pProc, ToolbarWindow32%idxTB%, ahk_class Shell_TrayWnd ; TB_GETBUTTON
	
		VarSetCapacity(btn, 32, 0)
		DllCall("ReadProcessMemory", "Uint", hProc, "Uint", pProc, "Uint", &btn, "Uint", 32, "Uint", 0)
		
		idn	:= NumGet(btn, 4)
		Statyle := NumGet(btn, 8, "Char")
		dwData := NumGet(btn, 12)
		If Not dwData
			dwData := NumGet(btn, 16, "int64")
			
		DllCall("ReadProcessMemory", "Uint", hProc, "Uint", dwData, "int64P", hWnd:=0, "Uint", NumGet(btn,12) ? 4:8, "Uint", 0)
		
		If Not hWnd ; group button, indicates the start of a group
		{
			If g_bundleCount >= %maxBundleCount%
				Break

			hidden := Statyle & 0x08 ; TBSTATE_HIDDEN
			If Not hidden
			{
				grpCollapsed := true
				g_bundleCount := g_bundleCount + 1
				AddBundle(g_bundleCount)
				
				GetTaskbarButtonTopLeft(idn, x, y)
				SetButtonTopLeftLoc(g_bundleCount, x, y)
			}
			Else
				grpCollapsed := false
		}
		else ; actual window button
		{
			If grpCollapsed
			{
				Add_hWndToArray(g_bundleCount, hWnd)
			}
			Else
			{
				g_bundleCount := g_bundleCount + 1
				AddBundle(g_bundleCount)
				Add_hWndToArray(g_bundleCount, hWnd)
				
				GetTaskbarButtonTopLeft(idn, x, y)
				SetButtonTopLeftLoc(g_bundleCount, x, y)
			}
		}
	}

	DllCall("VirtualFreeEx", "Uint", hProc, "Uint", pProc, "Uint", 0, "Uint", 0x8000)
	DllCall("CloseHandle", "Uint", hProc)
}

FocusButton(n)
{
	global g_bundleCount
	
	; these static variables can become inaccurate if windows are created or closed
	; inbetween pressing of hotkeys, but in practice, we can safely ignore the
	; inaccuracy
	static prevBundleIndex := 0
	static prevWindowIndex := 0

	Build_hWndArray(n)

	if (g_bundleCount >= n)
	{
		bundleSize := BundleSize(n)
		
		if n = %prevBundleIndex%
			windowIndex := Mod(prevWindowIndex, bundleSize) + 1
		else
			windowIndex := 1

		hWnd := Get_hWndFromArray(n, windowIndex)

		If bundleSize > 1 ; cycle through windows in the same bundle
			WinActivate, ahk_id %hWnd%
		Else ; single-window bundle; toggles between activating (restoring) and minimizing the window
			IfWinActive, ahk_id %hWnd%
				WinMinimize, ahk_id %hWnd%
			Else
				WinActivate, ahk_id %hWnd%
			
		prevBundleIndex := n
		prevWindowIndex := windowIndex
	}
}

GetTaskSwBar()
{
	ControlGet, hParent, hWnd,, MSTaskSwWClass1 , ahk_class Shell_TrayWnd
	ControlGet, hChild , hWnd,, ToolbarWindow321, ahk_id %hParent%
	Loop
	{
		ControlGet, hWnd, hWnd,, ToolbarWindow32%A_Index%, ahk_class Shell_TrayWnd
		If Not hWnd
			Break
		Else If hWnd = %hChild%
		{
			idxTB := A_Index
			Break
		}
	}
	Return	idxTB
}

GetTaskbarButtonTopLeft(id, ByRef x, ByRef y)
{
	idxTB := GetTaskSwBar()
	WinGet,	pidTaskbar, PID, ahk_class Shell_TrayWnd
	hProc := DllCall("OpenProcess", "Uint", 0x38, "int", 0, "Uint", pidTaskbar)
	pProc := DllCall("VirtualAllocEx", "Uint", hProc, "Uint", 0, "Uint", 32, "Uint", 0x1000, "Uint", 0x4)
	idxTB := GetTaskSwBar()

    SendMessage, 0x433, id, pProc, ToolbarWindow32%idxTB%, ahk_class Shell_TrayWnd ; TB_GETRECT
	;IfEqual, ErrorLevel, 0, return "Err: can't get rect"
	
	VarSetCapacity(rect, 32, 0)
	DllCall("ReadProcessMemory", "Uint", hProc, "Uint", pProc, "Uint", &rect, "Uint", 32, "Uint", 0)
	
	DllCall("VirtualFreeEx", "Uint", hProc, "Uint", pProc, "Uint", 0, "Uint", 0x8000)
	DllCall("CloseHandle", "Uint", hProc)
	
	ControlGet, hWnd, hWnd,, ToolbarWindow32%idxTB%, ahk_class Shell_TrayWnd
	WinGetPos, x, y, w, h, ahk_id %hWnd%
	
	left := NumGet(rect, 0)
	top := NumGet(rect, 4)
	right := NumGet(rect, 8)
	bottom := NumGet(rect, 12)

	x := x + left
	y := y + top
}
