local M = {}

M.borders = {
    none = true,
    single = true,
    double = true,
    rounded = true,
    solid = true,
    shadow = true,
}

function M.notify(message, level)
    vim.notify(message, level or vim.log.levels.INFO, {
        title = "Themer",
    })
end

function M.clamp(value, minimum, maximum)
    return math.max(minimum, math.min(maximum, value))
end

function M.is_valid_border(value)
    return M.borders[value] == true
end

function M.list_themes()
    return {
        "default",
        "midnight",
        "light",
    }
end

function M.theme_exists(name)
    if type(name) ~= "string" or name == "" then
        return false
    end

    return pcall(require, "themer.themes." .. name)
end

function M.get_theme(name)
    local ok, theme = pcall(require, "themer.themes." .. name)

    if not ok then
        return nil, theme
    end

    if type(theme.colors) ~= "function" then
        return nil, string.format(
            "Themer: theme '%s' must export a colors() function",
            name
        )
    end

    return theme
end

return M
