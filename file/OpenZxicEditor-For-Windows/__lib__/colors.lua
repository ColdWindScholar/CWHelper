-- colors.lua
-- ANSI 颜色码库，支持多种颜色及样式
-- 
-- 版权 (C) 2025 企鹅君Punguin
--
-- 本程序是自由软件：你可以根据自由软件基金会发布的GNU Affero通用公共许可证的条款，即许可证的第3版或（您选择的）任何后来的版本重新发布它和/或修改它。。
-- 本程序的发布是希望它能起到作用。但没有任何保证；甚至没有隐含的保证。本程序的分发是希望它是有用的，但没有任何保证，甚至没有隐含的适销对路或适合某一特定目的的保证。 参见 GNU Affero通用公共许可证了解更多细节。
-- 您应该已经收到了一份GNU Affero通用公共许可证的副本。 如果没有，请参见<https://www.gnu.org/licenses/>。
--
-- 联系我们：3618679658@qq.com
-- ChatGPT协助制作编写

local colors = {
    reset = "\27[0m",

    -- 普通前景色
    black = "\27[30m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m",

    -- 亮色前景色
	bright = "\27[1m",          --仅亮色
    bright_black = "\27[90m",
    bright_red = "\27[91m",
    bright_green = "\27[92m",
    bright_yellow = "\27[93m",
    bright_blue = "\27[94m",
    bright_magenta = "\27[95m",
    bright_cyan = "\27[96m",
    bright_white = "\27[97m",

    -- 加粗
    bold = "\27[1m",
    bold_black = "\27[1;30m",
    bold_red = "\27[1;31m",
    bold_green = "\27[1;32m",
    bold_yellow = "\27[1;33m",
    bold_blue = "\27[1;34m",
    bold_magenta = "\27[1;35m",
    bold_cyan = "\27[1;36m",
    bold_white = "\27[1;37m",

    -- 带下划线
    underline_black = "\27[4;30m",
    underline_red = "\27[4;31m",
    underline_green = "\27[4;32m",
    underline_yellow = "\27[4;33m",
    underline_blue = "\27[4;34m",
    underline_magenta = "\27[4;35m",
    underline_cyan = "\27[4;36m",
    underline_white = "\27[4;37m",

    -- 背景色
    bg_black = "\27[40m",
    bg_red = "\27[41m",
    bg_green = "\27[42m",
    bg_yellow = "\27[43m",
    bg_blue = "\27[44m",
    bg_magenta = "\27[45m",
    bg_cyan = "\27[46m",
    bg_white = "\27[47m",

    -- 亮色背景色
    bg_bright_black = "\27[100m",
    bg_bright_red = "\27[101m",
    bg_bright_green = "\27[102m",
    bg_bright_yellow = "\27[103m",
    bg_bright_blue = "\27[104m",
    bg_bright_magenta = "\27[105m",
    bg_bright_cyan = "\27[106m",
    bg_bright_white = "\27[107m",
}

return colors