SetCapsLockState, AlwaysOff

Flag:=true
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;普通模式
#if !Flag
ESC::
    Flag:=true
    ToolTip command,400,0
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
#if


;命令模式
#if Flag
i::
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
;-----------------------------------o                                
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
o::                                                       
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


#if
