-- prjmove.lua
-- 为OpenZxicEditor-For-Windows提供目录重命名功能
-- 
-- 版权所有 (C) 2024-2025 MiFi~Lab & OpenZxicEditor Developers. 
-- 版权所有 (C) 2024-2025 企鹅君Punguin. 
--
--
-- 本程序是自由软件：您可以基于自由软件基金会发布的GNU Affero通用公共许可证的条款下重新分发和/或修改它，或者本许可证第三版或者（由您选择）任何后续版本。
-- 分发本程序是希望它能派上用场，但没有任何担保，甚至也没有对其适销性或特定目的适用性的默示担保。更多细节请参见“GNU Affero通用公共许可证”。
-- 您应该已收到本程序随附的GNU Affero通用公共许可证的副本。如未收到，请参见：http://www.gnu.org/licenses/ 。
--


-- 读取 MTDs/name.txt
local f = io.open("MTDs/name.txt", "r")
local name = f:read("*all")
f:close()
-- 将 "MTDs" 目录重命名为 "z.固件名"，并将空格替换成点
os.rename("MTDs", "z." .. name:gsub(" ", "."))