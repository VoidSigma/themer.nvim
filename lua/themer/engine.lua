local M = {}

function M.apply(options, theme_name)
    theme_name = theme_name or options.theme

    local ok, theme = pcall(require, "themer.themes." .. theme_name)

    if not ok then
        vim.notify(
            string.format("Themer: unknown theme '%s'", theme_name),
            vim.log.levels.ERROR,
            { title = "Themer" }
        )
        return false
    end

    vim.cmd("highlight clear")

    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    local colors = theme.colors()

    require("themer.highlights").apply(colors)

    vim.g.colors_name = "themer-" .. theme_name

    return true
end

return M
