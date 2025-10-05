:: _编程器固件一键解包.bat
:: 为OpenZxicEditor-For-Windows提供Lua跳板
:: 
:: 版权所有 (C) 2024-2025 MiFi~Lab & OpenZxicEditor Developers. 
:: 版权所有 (C) 2024-2025 企鹅君Punguin. 
::
::
:: 本程序是自由软件：您可以基于自由软件基金会发布的GNU Affero通用公共许可证的条款下重新分发和/或修改它，或者本许可证第三版或者（由您选择）任何后续版本。
:: 分发本程序是希望它能派上用场，但没有任何担保，甚至也没有对其适销性或特定目的适用性的默示担保。更多细节请参见“GNU Affero通用公共许可证”。
:: 您应该已收到本程序随附的GNU Affero通用公共许可证的副本。如未收到，请参见：http://www.gnu.org/licenses/ 。

@echo off

REM 设置工作目录为当前脚本所在目录
cd /d "%~dp0"

REM 设置环境变量，便于调用二进制
set PATH=%CD%\__lib__\bin;%CD%\__lib__\sqfs_utils;%CD%\__lib__\jffs2_utils;%PATH%

REM 接收拖拽路径
set "file=%~1"
REM 先分割出各个分区
if not exist "%file%" (
    REM 没有拖拽文件，将会提示用户输入路径
    lua54 __lib__\\mtdcut.lua
) else (
    REM 使用拖拽文件
    lua54 __lib__\\mtdcut.lua "%file%"
)

REM 再解包各个分区
lua54 __lib__\\mtdunpk.lua

REM 重命名项目文件夹
lua54 __lib__\\prjmove.lua

pause
