:::::::批量修改jpg文件名.bat:::::::
@echo off
title 批量修改jpg文件名，将jpg文件的名称格式化为=> prefix06.jpg ，prefix26.jpg
setlocal EnableDelayedExpansion
:: 启用延迟变量扩充
 
:GetPath
set zpath=%CD%
 
:GetPrefix
set prefix=未命名
set /p prefix=请输入新前缀(禁用字符\/:*?"<>|)：
for /f "delims=\/:*?<>| tokens=2" %%i in ("z%prefix%z") do goto :GetPrefix
 
:GetExt
set ext=.jpg
 
:ReadyToRename
 
set /a num=1

for %%i in ("%zpath%\*%ext%") do (
echo "!num!%%i"

    if !num! LSS 10 (
        ren "%%i" "%prefix%0!num!%ext%" || echo 文件 %%i 改名失败 && set /a num-=1
    ) else ( 
        ren "%%i" "%prefix%!num!%ext%" || echo 文件 %%i 改名失败 && set /a num-=1
    )

    set /a num+=1
)
 
if %num%==0 echo %zpath%\ 里未发现任何文件。按任意键退出... & goto :PauseThenQuit

echo 文件改名完成，按任意键退出...
 
:PauseThenQuit
:pause>nul
::::::::::::::::::::::::::::::::
