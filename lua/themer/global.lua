local M = {}

function M.apply(options)
    local global = options.global

    vim.opt.termguicolors = global.termguicolors
    vim.opt.background = global.background
    vim.opt.winborder = global.borders

    vim.opt.cursorline = global.cursorline
    vim.opt.signcolumn = global.signcolumn
    vim.opt.laststatus = global.laststatus
    vim.opt.showmode = global.showmode

    vim.wo.number = global.number
    vim.wo.relativenumber = global.relativenumber
end

function M.float_config(options, config, overrides)
    config = config or {}
    overrides = overrides or {}

    config.border = config.border
        or overrides.border
        or options.global.borders

    return config
end

function M.style_float(options, winid, overrides)
    overrides = overrides or {}

    if not vim.api.nvim_win_is_valid(winid) then
        return
    end

    vim.wo[winid].winblend = overrides.winblend
        or options.global.winblend
end

return M
