@echo off

setlocal enabledelayedexpansion 
set pixw=%2
set pixh=%3

::rem 用于转换视频文件格式及大小

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
echo 该工具用于转换视频文件格式及大小。新老文件在相同目录(原名_s.新后缀)
echo 需要调用QuickMediaEditor中捆绑的ffmpeg，或请单独安装ffmpeg，并设置PATH环境变量。
echo.
echo 使用方法：av2x.bat  源视频文件名 宽度pix 高度pix
echo.

:end
