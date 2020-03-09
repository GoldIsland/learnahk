SetCapsLockState, AlwaysOff

;临时使用
;F11::Send, ^{c}   
;F12::Send, ^{v}
;Send {Alt Up}{Ctrl Up}{Shift Up}
;RCtrl::Send {Ctrl Down}



;读书 摘抄笔记 
^+!c::                                    
    Send, ^c 
    Sleep, 100
    Send, !{Tab}
    Sleep, 200
    Send, ^v
    ;Send, !{Tab}
    ;Sleep, 100
return 
^+!b::                                    
    Send, ^c 
    Sleep, 100
    Send, !{Tab}
    Sleep, 300
    Send, ^v
    ;Send, !{Tab}
    ;Sleep, 100
return 

; 打开app
;Run D:\software\Sublime Text 3\sublime_text.exe
#s::
    DetectHiddenWindows, on
    IfWinNotExist ahk_class PX_WINDOW_CLASS
    Run D:\software\Sublime Text 3\sublime_text.exe
        Else
    IfWinNotActive ahk_class PX_WINDOW_CLASS
    WinActivate
        Else
    WinMinimize
    return

#`::
    DetectHiddenWindows, on
    IfWinNotExist ahk_class TTOTAL_CMD
    Run D:\Users\Lenovo\AppData\Local\TotalCMD64\Totalcmd64.exe
        Else
    IfWinNotActive ahk_class TTOTAL_CMD
    WinActivate
        Else
    WinMinimize
    Return

; 打开网址
#g::Run https://www.google.com.hk/webhp
    return 

RAlt & l::SendMessage,0x112,0xF170,2,,Program Manager
RAlt::RButton
;XButton1::!Right
;XButton2::!Left

; 文字快捷键
:*:/=::= "";{Left}{Left}
:*:/--::------------------------------------------------------------------
:*:/++::" {+}  {+} "{Left}{Left}{Left}{Left}
:*:/sf::select * from{Space}

:*:/dt::  ; 此热字串通过后面的命令把 "]d" 替换成当前日期和时间.
FormatTime, CurrentDateTime,, yyyy/M/d HH:mm:ss  ; 看起来会像 9/1/2005 3:53 PM 这样
SendInput %CurrentDateTime%
return
CapsLock & r::                                    
    Send, ^+r                                                                  
return  

CapsLock & d::                                    
    if GetKeyState("alt") = 0                                        
        Send, {Del}                                               
    else                                                             
        Send, ^{Del}                                                
    return                                                                    
return    

CapsLock & b::                                    
    if GetKeyState("alt") = 0                                        
        Send, {BS}                                               
    else                                                             
        Send, ^{BS}                                                
    return                                                                    
return      
 
F1:: Send,^{s}
CapsLock & x:: Send, ^{x}  
CapsLock & s:: Send, ^{s} 
CapsLock & t:: Send, ^{t}  
CapsLock & c:: Send, ^{c}   
CapsLock & v:: Send, ^{v}
CapsLock & z:: Send, ^{z}  
CapsLock & 5:: Send, {F5}  
CapsLock & 6:: Send, {F6}  
CapsLock & 8:: Send, {F8}   

CapsLock & w:: 
    Send, ^+{Left}
    return

CapsLock & q:: 
    Send, +{Home}
    Send, {Del}
    return

CapsLock & e:: 
    Send, ^+{Right}  
    return
    
CapsLock & 1:: 
    Send, ^{Delete}  
    Send, ^{F5}
    return

CapsLock & 2:: 
    Send, ^{Home}  
    Send, {Enter}{Enter}{Enter}
    Send, ^{Home}  
    return

CapsLock & 3:: 
    Send, ^{c}  
    Send, !{Tab}
    Sleep, 2
    Send, ^{v}  
    return

CapsLock & 4:: 
    Send, {Esc}  
    Send, {Tab}
    Send, {Enter}
    return
    

;=====================================================================o
;                    CapsLock Direction Navigator                    
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          
;                      CapsLock + j |  Down                          
;                      CapsLock + k |  Up                            
;                      CapsLock + l |  Right                         
;                      Ctrl, Alt Compatible                          
;--------------------------------------------------------------------o
CapsLock & h::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Left}                                                 
    else                                                             
        Send, +{Left}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Left}                                                
    else                                                             
        Send, +^{Left}                                               
    return                                                           
}                                                                    
return                                                               
;-----------------------------------o                                
CapsLock & j::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Down}                                                 
    else                                                             
        Send, +{Down}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Down}                                                
    else                                                             
        Send, +^{Down}                                               
    return                                                           
}                                                                    
return                                                               
;-----------------------------------o                                
CapsLock & k::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Up}                                                   
    else                                                             
        Send, +{Up}                                                  
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Up}                                                  
    else                                                             
        Send, +^{Up}                                                 
    return                                                           
}                                                                    
return                                                               
;-----------------------------------o                                
CapsLock & l::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Right}                                                
    else                                                             
        Send, +{Right}                                               
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Right}                                               
    else                                                             
        Send, +^{Right}                                              
    return                                                           
}                                                                    
return                                                               
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          
;                      CapsLock + o |  End                           
;                      Ctrl, Alt Compatible                          
;-----------------------------------o---------------------------------o
CapsLock & i::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {Home}                                                 
    else                                                             
        Send, +{Home}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{Home}                                                
    else                                                             
        Send, +^{Home}                                               
    return                                                           
}                                                                    
return                                                               
;-----------------------------------o                                
CapsLock & o::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {End}                                                  
    else                                                             
        Send, +{End}                                                 
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{End}                                                 
    else                                                             
        Send, +^{End}                                                
    return                                                           
}                                                                    
return                                                               
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       
;-----------------------------------o---------------------------------o
;                      CapsLock + u |  PageUp                        
;                      CapsLock + p |  PageDown                      
;                      Ctrl, Alt Compatible                          
;-----------------------------------o---------------------------------o
CapsLock & u::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {PgUp}                                                 
    else                                                             
        Send, +{PgUp}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{PgUp}                                                
    else                                                             
        Send, +^{PgUp}                                               
    return                                                           
}                                                                    
return                                                               
;-----------------------------------o                                
CapsLock & p::                                                       
if GetKeyState("control") = 0                                        
{                                                                    
    if GetKeyState("alt") = 0                                        
        Send, {PgDn}                                                 
    else                                                             
        Send, +{PgDn}                                                
    return                                                           
}                                                                    
else {                                                               
    if GetKeyState("alt") = 0                                        
        Send, ^{PgDn}                                                
    else                                                             
        Send, +^{PgDn}                                               
    return                                                           
}                                                                    
return                                                               
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Mouse Controller                      
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      
;                   CapsLock + Down |  Mouse Down                    
;                   CapsLock + Left |  Mouse Left                    
;                  CapsLock + Right |  Mouse Right                   
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      
;-----------------------------------o---------------------------------o
CapsLock & Up::    MouseMove, 0, -10, 0, R                           
CapsLock & Down::  MouseMove, 0, 10, 0, R                            
CapsLock & Left::  MouseMove, -10, 0, 0, R                           
CapsLock & Right:: MouseMove, 10, 0, 0, R                            
;-----------------------------------o                                
CapsLock & Enter::                                                   
SendEvent {Blind}{LButton down}                                      
KeyWait Enter                                                        
SendEvent {Blind}{LButton up}                                        
return                                                               
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         
;-----------------------------------o---------------------------------o
;                     CapsLock + .  |  Ctrl + Delete (Delete a Word) 
;                     CapsLock + ,  |  Delete                        
;                     CapsLock + m  |  BackSpace                     
;                     CapsLock + n  |  Ctrl + BackSpace              
;-----------------------------------o---------------------------------o
CapsLock & ,:: Send, {Del}                                           
CapsLock & .:: Send, ^{Del}                                          
CapsLock & m:: Send, {BS}                                            
CapsLock & n:: Send, ^{BS}                                           







;~ ; 计时器
;~ RWin::
;~ InputBox, time, time(minute)
;~ time := time*60000
;~ ; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
;~ Sleep,%time%
;~ MsgBox %time%,End........
;~ return

; 优化计时器
;~ RWin::
;~ InputBox, time, time(minute)
;~ time := time
;~ ; 如果一个变量要做计算的话，一定要像这样写，和平常的算式相比，多了一个冒号。sleep 的时间是按照千分之一秒算的，这里乘以 1000 就变成秒了。
;~ Loop, %time%
;~ {
	;~ ToolTip %time%,400,0
    ;~ Sleep,60000
	;~ time--
	;~ ToolTip %time%,400,0
;~ }
;~ MsgBox %time%,End........
;~ return
