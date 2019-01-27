:: 为mp4文件名添加‘_s’，使其变为：abc_s.mp4 格式。

cd D:\temp\small\

for /r %%i in (*.mp4) do ren %%~ni.mp4  %%~ni_s.mp4
