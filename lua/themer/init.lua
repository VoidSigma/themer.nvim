local config = require("themer.config")
local engine = require("themer.engine")
local global = require("themer.global")
local util = require("themer.util")

local M = {}

M.options = config.get()

local function refresh()
    M.options = config.get()
end

function M.setup(user_options)
    config.setup(user_options)
    refresh()

    require("themer.commands").create(M)

    if M.options.enabled then
        M.apply()
    end

    return M
end

function M.apply(theme_name)
    if not M.options.enabled then
        return false
    end

    if theme_name ~= nil then
        M.options.theme = theme_name
    end

    global.apply(M.options)

    local ok = engine.apply(M.options, M.options.theme)

    if ok then
        vim.api.nvim_exec_autocmds("User", {
            pattern = "ThemerApplied",
            modeline = false,
        })
    end

    return ok
end

function M.enable()
    M.options.enabled = true

    local ok = M.apply()

    if ok then
        util.notify(string.format("Enabled '%s'", M.options.theme))
    end

    return ok
end

function M.disable()
    M.options.enabled = false
    util.notify("Disabled")
end

function M.toggle()
    if M.options.enabled then
        M.disable()
        return false
    end

    return M.enable()
end

function M.use(theme_name)
    if not util.theme_exists(theme_name) then
        util.notify(
            string.format("Theme '%s' was not found", tostring(theme_name)),
            vim.log.levels.ERROR
        )
        return false
    end

    M.options.theme = theme_name

    if M.options.enabled then
        return M.apply()
    end

    util.notify(string.format("Selected '%s'", theme_name))

    return true
end

function M.set_border(border)
    if not util.is_valid_border(border) then
        util.notify(
            string.format("Invalid border '%s'", tostring(border)),
            vim.log.levels.ERROR
        )
        return false
    end

    M.options.global.borders = border
    vim.opt.winborder = border

    vim.diagnostic.config({
        float = {
            border = border,
        },
    })

    return true
end

function M.set_winblend(value)
    value = tonumber(value)

    if value == nil then
        util.notify("winblend must be a number from 0 to 100", vim.log.levels.ERROR)
        return false
    end

    M.options.global.winblend = util.clamp(value, 0, 100)

    return true
end

function M.float_config(float_config, overrides)
    return global.float_config(M.options, float_config, overrides)
end

function M.style_float(winid, overrides)
    return global.style_float(M.options, winid, overrides)
end

function M.apply_window(winid)
    return global.apply_window(M.options, winid)
end

function M.list_themes()
    return util.list_themes()
end

function M.status()
    return {
        enabled = M.options.enabled,
        theme = M.options.theme,
        borders = M.options.global.borders,
        winblend = M.options.global.winblend,
    }
end

return M
