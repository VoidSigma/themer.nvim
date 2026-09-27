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

    vim.diagnostic.config({
        virtual_text = global.diagnostic.virtual_text,
        signs = global.diagnostic.signs,
        underline = global.diagnostic.underline,
        update_in_insert = global.diagnostic.update_in_insert,
        severity_sort = global.diagnostic.severity_sort,
        float = {
            border = global.borders,
        },
    })
end

function M.apply_window(options, winid)
    winid = winid or 0

    if not vim.api.nvim_win_is_valid(winid) then
        return
    end

    local global = options.global

    vim.wo[winid].number = global.number
    vim.wo[winid].relativenumber = global.relativenumber
end

function M.float_config(options, float_config, overrides)
    float_config = float_config or {}
    overrides = overrides or {}

    if float_config.border == nil then
        float_config.border = overrides.border or options.global.borders
    end

    return float_config
end

function M.style_float(options, winid, overrides)
    overrides = overrides or {}

    if not vim.api.nvim_win_is_valid(winid) then
        return false
    end

    local blend = overrides.winblend

    if blend == nil then
        blend = options.global.winblend
    end

    vim.wo[winid].winblend = blend

    return true
end

return M
