:: ��д��img (1).jpg���������ļ�����Ϊ ��img_1.jpg��

@Echo Off & SetLocal ENABLEDELAYEDEXPANSION

FOR %%a in (*) do (
  set "name=%%a"

::�������Ҫ�»��ߣ���ֱ��ȥ���Ϳ���
  set "name=!name: (=_!"
  set "name=!name:)=!"
  ren "%%a" "!name!"
)

exit
