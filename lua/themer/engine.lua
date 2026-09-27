local util = require("themer.util")

local M = {}

function M.apply(options, theme_name)
    theme_name = theme_name or options.theme

    local theme, error_message = util.get_theme(theme_name)

    if not theme then
        util.notify(error_message, vim.log.levels.ERROR)
        return false
    end

    local colors = theme.colors()

    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    require("themer.highlights").apply(colors)
    require("themer.integrations").apply(options, colors)

    if type(theme.apply) == "function" then
        theme.apply(colors)
    end

    vim.g.colors_name = "themer-" .. theme_name

    return true
end

return M
