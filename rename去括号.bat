:: 改写“img (1).jpg”这样的文件名称为：“img_1.jpg”

@Echo Off & SetLocal ENABLEDELAYEDEXPANSION

FOR %%a in (*) do (
  set "name=%%a"

::如果不想要下划线，就直接去掉就可以
  set "name=!name: (=_!"
  set "name=!name:)=!"
  ren "%%a" "!name!"
)

exit
