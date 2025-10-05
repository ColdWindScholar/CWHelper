@echo off
cd file\dongle_fun\
mode con: cols=52 lines=20
title 企鹅君PINGUIN_dongle_fun调用工具     当前版本: 5.0
color 3
echo 企鹅君PINGUIN_dongle_fun调用工具      当前版本: 5.0
echo 版权所有 (c)2023-2099 企鹅君PINGUIN 保留所有权利。
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo           欢迎使用船新版本dongle_fun
echo     按下任意键来开始替换电脑上已存在的dongle_fun
echo            (每次使用均需重新替换一次)
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  请稍后，正在删除旧文件
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
echo 企鹅君PINGUIN_dongle_fun调用工具      当前版本: 5.0                
echo 版权所有 (c)2023-2099 企鹅君PINGUIN 保留所有权利。
echo.
echo.
echo.
del /q /f C:\dongle_fun\firmware\mtd4_v1_modi.bin
echo dongle_fun替换完成,开始篡改dongle_fun主线程
echo.
set /p input=请拖入MDT4分区文件或手动输入文件地址,后缀随意:
set source="%input%"
set destination="C:\dongle_fun\firmware\mtd4_v1_modi.bin"
copy %source% %destination%
echo.
start C:\dongle_fun\donglefun_v2.7.exe
exit