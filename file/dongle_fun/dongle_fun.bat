@echo off
cd file\dongle_fun\
mode con: cols=52 lines=20
title ����PINGUIN_dongle_fun���ù���     ��ǰ�汾: 5.0
color 3
echo ����PINGUIN_dongle_fun���ù���      ��ǰ�汾: 5.0
echo ��Ȩ���� (c)2023-2099 ����PINGUIN ��������Ȩ����
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo           ��ӭʹ�ô��°汾dongle_fun
echo     �������������ʼ�滻�������Ѵ��ڵ�dongle_fun
echo            (ÿ��ʹ�þ��������滻һ��)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  ���Ժ�����ɾ�����ļ�
del /q /f C:\dongle_fun\css
del /q /f C:\dongle_fun\firmware
del /q /f C:\dongle_fun\image
del /q /f C:\dongle_fun\units
echo.
echo.
set "source_file=dongle_fun.7z"
set "destination_folder=C:\"
set "seven_zip=7z.exe"
"%seven_zip%" x "%source_file%" -o"%destination_folder%" -aoa
cls
echo ����PINGUIN_dongle_fun���ù���      ��ǰ�汾: 5.0                
echo ��Ȩ���� (c)2023-2099 ����PINGUIN ��������Ȩ����
echo.
echo.
echo.
del /q /f C:\dongle_fun\firmware\mtd4_v1_modi.bin
echo dongle_fun�滻���,��ʼ�۸�dongle_fun���߳�
echo.
set /p input=������MDT4�����ļ����ֶ������ļ���ַ,��׺����:
set source="%input%"
set destination="C:\dongle_fun\firmware\mtd4_v1_modi.bin"
copy %source% %destination%
echo.
start C:\dongle_fun\donglefun_v2.7.exe
exit