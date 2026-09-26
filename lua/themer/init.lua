local config = require("themer.config")
local engine = require("themer.engine")
local global = require("themer.global")

local M = {}

M.opt = config.options
M.global = config.options.global

local function refresh()
    M.opt = config.options
    M.global = config.options.global
end

function M.setup(user_options)
    config.setup(user_options)
    refresh()

    require("themer.commands").create(M)

    if M.opt.enabled then
        M.apply()
    end

    return M
end

function M.apply(theme_name)
    if not M.opt.enabled then
        return false
    end

    if theme_name then
        M.opt.theme = theme_name
    end

    global.apply(M.opt)

    return engine.apply(M.opt, M.opt.theme)
end

function M.enable()
    M.opt.enabled = true
    return M.apply()
end

function M.disable()
    M.opt.enabled = false
end

function M.toggle()
    if M.opt.enabled then
        M.disable()
    else
        M.enable()
    end
end

function M.use(theme_name)
    M.opt.theme = theme_name

    if M.opt.enabled then
        return M.apply()
    end

    return true
end

function M.set_border(border)
    M.global.borders = border
    vim.opt.winborder = border
end

function M.set_winblend(value)
    value = tonumber(value) or 0
    M.global.winblend = math.max(0, math.min(100, value))
end

function M.float_config(config_table, overrides)
    return global.float_config(M.opt, config_table, overrides)
end

function M.style_float(winid, overrides)
    global.style_float(M.opt, winid, overrides)
end

return M
