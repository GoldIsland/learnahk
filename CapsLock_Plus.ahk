SetCapsLockState, AlwaysOff

;临时使用
;F11::Send, ^{c}   
;F12::Send, ^{v}
;Send {Alt Up}{Ctrl Up}{Shift Up}
RCtrl::Send {Ctrl Down}

Flag:=false
CapsLock & a::
if(Flag:=!Flag ){
    ToolTip command,400,0
}else{
    ToolTip edit,400,0 ;按键功能不变
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;命令模式
#if Flag
ESC::
    Flag:=false
    ToolTip edit,400,0 ;按键功能不变
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

#if
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

; 打开app
#s::Run D:\Program Files\Sublime Text 3\sublime_text.exe 
    return
#v::Run D:\software\Vim\vim81\gvim.exe
    return 
#`::Run D:\Users\Administrator\AppData\Local\TotalCMD64\Totalcmd64.exe
    return

; 打开网址
#b::Run https://www.baidu.com/
    return 

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

CapsLock & x:: Send, ^{x}  
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
    
;;摘抄;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
