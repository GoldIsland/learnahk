;--------------------------------------------以下为事件区域--------------------------------------------------
;程序入口
f6::
  SetTimer, autowrite,50000
return

autowrite:
  ;第一步
  WinActivate, %maintitle%
  Sleep, 2000
  Send, {f5}
  Sleep, 2000
  Send, {end}
  MouseClick, left,  123,  441
  Sleep, 5000
  ;获取打开页面的标题,这里一定要先确保打开了。所以延时久一点
  WinGetActiveTitle, title
  ;这里做判断，如果title==title2 不留言，关闭 如果title!=tital2 留言，关闭 ，并且赋值title2 = title
  If title = title2
    {
      IfWinNotActive,%title%
        {
          WinActivate, %title%
        }
      IfWinActive,%title%
        {
          WinWaitActive, %title%
          Sleep, 2000
          WinMaximize,%title%
          Sleep, 3000
          WinClose,%title%     ;关闭留言页面
          WinActivate, %maintitle%
          WinMaximize,%maintitle%
          Sleep, 1000
          Send,{home}
        }
    }
  Else
    {
      IfWinNotActive,%title%
        {
          WinActivate, %title%
        }
      IfWinActive,%title%
        {
          WinWaitActive, %title%
          Sleep, 2000
          WinMaximize,%title%
          Sleep, 3000
          Send, {end}
          MouseClick, left,  229,  408
          Sleep, 3000
          ;这里设计为变量，获取随机数
          Random, rand, 2, 13
          sendstring( string%rand% )
          Sleep, 5000
/* 这个在有的地方不支持，换成鼠标点击
send,{ctrl down}
send,{enter}
send,{ctrl up}
*/
          MouseClick, left,  247,  517
          Sleep, 3000
          WinClose,%title%     ;关闭留言页面
          WinActivate, %maintitle%
          WinMaximize,%maintitle%
          Sleep, 1000
          Send,{home}
          title2 := title
        }
    }
return

;测试函数
f9::
  Random, rand, 1, 7
  sendstring( string%rand% )
  Send,{Enter}
return
;测试计时函数
f10::
  SetTimer, writestring, 1000
return
f11::
  SetTimer, writestring, off
return
writestring:
  Random, rand, 1, 7
  sendstring( string%rand% )
  Send,{Enter}
return

;--------------------------------------------以下为辅助函数区域--------------------------------------------------
;函数1
;发送中文辅助函数
sendstring( string )
  {
    len := StrLen(string)  ; 得到字符串的长度，注意一个中文字符的长度是2，即占2个字节
    keys := ""                  ; 将要发送的字符序列
    index := 1                  ; 用于循环
    Loop
      {
        isunicodechar := false
        code2 := 0                                             ; 字符2的ascii码
        code1 := Asc( SubStr(string, index, 1) )    ; 得到第一个字符的ascii值
        if(code1 >= 129 && code1 <= 254 && index < len)   ; 判断是否中文字符的第一个字符
        {
          code2 := Asc( SubStr(string, index+1, 1) )            ; 得到第二个字符的ascii值
          if(code2 >= 64 && code2 <= 254)        ; 若条件成立则说明是中文字符
          {
            isunicodechar := true
            code1 <<= 8                                  ; 第一个字符应放到高8位上
            code1 += code2                              ; 第二个字符放在低8位上
          }
      }
    if( isunicodechar )
    keys .= "{asc " . code1 . "}"
    Else
      {
        keys .= "{asc 0" . code1 . "}"                ; 如果非中文字符，则需要前缀一个0
        if( code2 > 0 )
        keys .= "{asc 0" . code2 . "}"
      }
    if(index > len)
    break
  }
Send % keys
}