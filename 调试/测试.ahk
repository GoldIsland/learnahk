;测试用例如下：

#Include E:\数据库\code\AHK\调试\debug.ahk
target=E:\数据库\code\AHK\调试\acc.accdb 
array := ["one", "two"]

thing := {}
thing.foo := "three"

debug("target")
debug(array)
debug(thing)

return