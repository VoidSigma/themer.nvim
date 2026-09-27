local M = {}

local function set(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

function M.apply(options, c)
    local enabled = options.integrations

    if enabled.telescope then
        set("TelescopeNormal", { fg = c.fg, bg = c.float_bg })
        set("TelescopeBorder", { fg = c.border, bg = c.float_bg })
        set("TelescopeSelection", { fg = c.fg, bg = c.visual })
        set("TelescopeMatching", { fg = c.accent, bold = true })
    end

    if enabled.cmp then
        set("CmpItemAbbr", { fg = c.fg })
        set("CmpItemAbbrMatch", { fg = c.accent, bold = true })
        set("CmpItemKind", { fg = c.cyan })
    end

    if enabled.gitsigns then
        set("GitSignsAdd", { fg = c.green })
        set("GitSignsChange", { fg = c.yellow })
        set("GitSignsDelete", { fg = c.red })
    end

    if enabled.which_key then
        set("WhichKey", { fg = c.accent })
        set("WhichKeyGroup", { fg = c.cyan })
        set("WhichKeyDesc", { fg = c.fg })
    end

    if enabled.neo_tree then
        set("NeoTreeNormal", { fg = c.fg, bg = c.bg })
        set("NeoTreeNormalNC", { fg = c.fg, bg = c.bg })
        set("NeoTreeDirectoryName", { fg = c.blue })
        set("NeoTreeDirectoryIcon", { fg = c.blue })
    end
end

return M
