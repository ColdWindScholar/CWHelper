:: _�ϲ�����MTD����.bat
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

REM �ȴ�� �ٺϲ�
if exist "%file%" (
    REM ʹ����ק·��
    lua54 __lib__\\mtdrepk.lua "%file%"
    lua54 __lib__\\mtdjoin.lua "%file%"
) else if exist "MTDs" (
    REM ʹ�þ���·��
    lua54 __lib__\\mtdrepk.lua "MTDs"
    lua54 __lib__\\mtdjoin.lua "MTDs"
) else (
    REM û����ק�ļ���������ʾ�û����ʹ��
    echo ʹ�÷�����
    echo  1. ��������z.��ͷ�Ĺ����ļ�����ק�����bat�ļ���
    echo  2. �������ļ��з���ͬĿ¼�²�������ΪMTDs
    echo.
) 

pause
