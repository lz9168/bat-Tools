:::::::�����޸�jpg�ļ���.bat:::::::
@echo off
title �����޸�jpg�ļ���
setlocal EnableDelayedExpansion
:: �����ӳٱ�������
 
:GetPath
set zpath=%CD%
 
:GetPrefix
set prefix=δ����
set /p prefix=��������ǰ׺(�����ַ�\/:*?"<>|)��
for /f "delims=\/:*?<>| tokens=2" %%i in ("z%prefix%z") do goto :GetPrefix
 
:GetExt
set ext=.jpg
 
:ReadyToRename
 
set /a num=1

for %%i in ("%zpath%\*%ext%") do (
echo "!num!%%i"

    if !num! LSS 10 (
        ren "%%i" "%prefix%0!num!%ext%" || echo �ļ� %%i ����ʧ�� && set /a num-=1
    ) else ( 
        ren "%%i" "%prefix%!num!%ext%" || echo �ļ� %%i ����ʧ�� && set /a num-=1
    )

    set /a num+=1
)
 
if %num%==0 echo %zpath%\ ��δ�����κ��ļ�����������˳�... & goto :PauseThenQuit

echo �ļ�������ɣ���������˳�...
 
:PauseThenQuit
:pause>nul
::::::::::::::::::::::::::::::::
