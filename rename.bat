:::::::�����޸��ļ���.bat:::::::
@echo off
title �����޸��ļ���
setlocal EnableDelayedExpansion
:: �����ӳٱ�������
 
:GetPath
set zpath=%CD%
:: �Ա������г�ʼ������ֹ�û��������ֱ������������%CD%��ʾ��ǰ·��
set /p zpath=������Ŀ���ļ����ڵ�·����
if %zpath:~0,1%%zpath:~-1%=="" set zpath=%zpath:~1,-1%
:: ������ zpath �ĵ�һ�������һ���ַ��Ƿ�Ϊ "" ���ǵĻ���ȥ��
if not exist "%zpath%" goto :GetPath
:: ��� zpath ֵ��·�������ڣ��͵���ת��ȥ��Ҫ����������
 
:GetPrefix
set prefix=δ����
set /p prefix=�������ļ���ǰ׺(���ܰ��������ַ�\/:*?"<>|)��
for /f "delims=\/:*?<>| tokens=2" %%i in ("z%prefix%z") do goto :GetPrefix
:: ����Ա��� perfix ���м�飬�����зǷ����ű���ת�� :GetPrefix
:: ��ʵ�ϣ����ﲢû�ж�˫���� " ���м�⣬��Ϊ˫�����޷��ڴ˱�ת��Ϊ���õķָ���
:: ��ʹ����������������ȷ��ʹ��˫����Ҳ����������쳣���˳���
:: ��ˣ���������ķǳ����Ի�������һ�����׵�����
 
:GetExt
set ext=.*
set /p ext=�������ļ�����չ��(���������ʾ��������)��
if not "%ext:~0,1%"=="." set ext=.%ext%
:: ������ ext �ĵ�һ���Ƿ�Ϊ��� . �����ǵĻ��ͼ���
:: ��������Ա��� ext Ҳ���һ�£������г�*��ķǷ����ű���ת�� :GetExt
 
set answer=N
echo.
echo ����ͼ�� %zpath%\ ������� %ext% ���͵��ļ��� %prefix% Ϊǰ׺�����������������Ƿ������
set /p answer=���������� Y ����������������...
if "%answer%"=="Y" goto :ReadyToRename
if "%answer%"=="y" goto :ReadyToRename
 
echo �����ļ���������������˳�... & goto :PauseThenQuit
 
:ReadyToRename
 
set /a num=0
echo.
 
if "%ext%"==".*" (
  for %%i in ("%zpath%\*%ext%") do (
    set /a num+=1
    ren "%%i" "%prefix%!num!%%~xi" || echo �ļ� %%i ����ʧ�� && set /a num-=1
  )
) else (
  for %%i in ("%zpath%\*%ext%") do (
    set /a num+=1
    ren "%%i" "%prefix%!num!%ext%" || echo �ļ� %%i ����ʧ�� && set /a num-=1
  )
)
 
if %num%==0 echo %zpath%\ ��δ�����κ��ļ�����������˳�... & goto :PauseThenQuit
 
echo �ļ�������ɣ���������˳�...
 
:PauseThenQuit
pause>nul
::::::::::::::::::::::::::::::::
