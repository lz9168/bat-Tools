@echo off

setlocal enabledelayedexpansion 
set pixw=%2
set pixh=%3

::rem ����ת����Ƶ�ļ���ʽ����С

if "%1"=="" goto usage
if "%1"=="/?" goto usage

if "%2"=="" set pixw=640
if "%3"=="" set pixh=360

set ffmpegparms=-i %1 -b:v 180k -bufsize 200k -maxrate 250k -ar 11025 -ac 1 -r 20 -vf scale=!pixw!:!pixh! %~n1_s.mp4
echo ffmpeg %ffmpegparms%
echo.
ffmpeg %ffmpegparms%
goto end

:usage
echo.
echo �ù�������ת����Ƶ�ļ���ʽ����С�������ļ�����ͬĿ¼(ԭ��_s.�º�׺)
echo ��Ҫ����QuickMediaEditor�������ffmpeg�����뵥����װffmpeg��������PATH����������
echo.
echo ʹ�÷�����av2x.bat  Դ��Ƶ�ļ��� ���pix �߶�pix
echo.

:end
