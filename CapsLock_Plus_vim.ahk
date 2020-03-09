SetCapsLockState, AlwaysOff

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;通用模式
#b::Run https://www.baidu.com/
    return 
#s::Run D:\Program Files\Sublime Text 3\sublime_text.exe 
    return
#`::Run D:\Users\Administrator\AppData\Local\TotalCMD64\Totalcmd64.exe
    return
RCtrl::
    Send,{Ctrl}
    Sleep, 100
    Send,{Ctrl}
    return

:*:/sf::select * from{Space}

:*:/dt::  ; 此热字串通过后面的命令把 "]d" 替换成当前日期和时间.
FormatTime, CurrentDateTime,, yyyy/M/d HH:mm:ss  ; 看起来会像 9/1/2005 3:53 PM 这样
SendInput %CurrentDateTime%
return

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

CapsLock & 2:: 
    Send, ^{Home}  
    Send, {Enter}{Enter}{Enter}
    Send, ^{Home}  
    return


Flag:=false
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;普通模式
#if !Flag
ESC::
    Send {Shift Up}
    Send,{Esc}
    Flag:=true
    MouseGetPos, MouseX, MouseY 
    ;ToolTip command,MouseX, MouseY 
    return

                                       
#if


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
CapsLock & n::                                                       
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
;CapsLock & ,:: Send, {Del}                                           
;CapsLock & .:: Send, ^{Del}                                          
;CapsLock & m:: Send, {BS}                                            
;CapsLock & n:: Send, ^{BS}    
CapsLock & x::
    Send,{Del}
    return

CapsLock & d::
    Send,{Del}
    return
;命令模式
#if Flag
; 进入编辑模式
CapsLock::
    SetCapsLockState, AlwaysOff
    Flag:=false
    MouseGetPos, MouseX, MouseY 
   ;ToolTip edit,MouseX+600, MouseY 
    return

ESC::
    Send {Shift Up}
    Send,{Esc}
    return

;; d dd
#SingleInstance Force
; 用于统计按键次数
gnPressCount := 0
d::
{
    gnPressCount += 1
    SetTimer, ProcSubroutine, Off
    SetTimer, ProcSubroutine, 100
    Return
}
ProcSubroutine:
{
    ; 在计时器事件触发时，需要将其关掉
    SetTimer, ProcSubroutine, Off
    If gnPressCount = 1
    {
        ; 第一类行为
        Send,^{x}
    }Else If gnPressCount = 2
    {
        ; 第二类行为
        Send,{Home}
        Send {Shift Down}
        Send,{End}
        Send {Shift Up}
        Send,^{x}
    }
    ; 在结束后，还需要将鼠标右键的按键次数置为0，以方便下次使用
    gnPressCount := 0
    Return
}

gnPressCounty := 0
y::
{
    gnPressCounty += 1
    SetTimer, ProcSubroutine1, Off
    SetTimer, ProcSubroutine1, 200
    Return
}
ProcSubroutine1:
{
    ; 在计时器事件触发时，需要将其关掉
    SetTimer, ProcSubroutine1, Off
    If gnPressCounty = 1
    {
        ; 第一类行为
        Send,^{c}
    }Else If gnPressCounty = 2
    {
        ; 第二类行为
        Send,{Home}
        Send {Shift Down}
        Send,{End}
        Send {Shift Up}
        Send,^{c}
    }
    ; 在结束后，还需要将鼠标右键的按键次数置为0，以方便下次使用
    gnPressCounty := 0
    Return
}

p::
    Send,^{v}
    return 
CapsLock & u::
    Send,^{z}
    return 

h::                                                       
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

j::                                                       
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

k::                                                       
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


l::                                                       
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

; 暂时使用                            
n::                                                       
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
u::                                                       
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
#if
