:: _������̼�һ�����.bat
:: ΪOpenZxicEditor-For-Windows�ṩLua����
:: 
:: ��Ȩ���� (C) 2024-2025 MiFi~Lab & OpenZxicEditor Developers. 
:: ��Ȩ���� (C) 2024-2025 ����Punguin. 
::
::
:: ����������������������Ի��������������ᷢ����GNU Afferoͨ�ù������֤�����������·ַ���/���޸��������߱����֤��������ߣ�����ѡ���κκ����汾��
:: �ַ���������ϣ�����������ó�����û���κε���������Ҳû�ж��������Ի��ض�Ŀ�������Ե�Ĭʾ����������ϸ����μ���GNU Afferoͨ�ù������֤����
:: ��Ӧ�����յ��������渽��GNU Afferoͨ�ù������֤�ĸ�������δ�յ�����μ���http://www.gnu.org/licenses/ ��

@echo off

REM ���ù���Ŀ¼Ϊ��ǰ�ű�����Ŀ¼
cd /d "%~dp0"

REM ���û������������ڵ��ö�����
set PATH=%CD%\__lib__\bin;%CD%\__lib__\sqfs_utils;%CD%\__lib__\jffs2_utils;%PATH%

REM ������ק·��
set "file=%~1"
REM �ȷָ����������
if not exist "%file%" (
    REM û����ק�ļ���������ʾ�û�����·��
    lua54 __lib__\\mtdcut.lua
) else (
    REM ʹ����ק�ļ�
    lua54 __lib__\\mtdcut.lua "%file%"
)

REM �ٽ����������
lua54 __lib__\\mtdunpk.lua

REM ��������Ŀ�ļ���
lua54 __lib__\\prjmove.lua

pause
