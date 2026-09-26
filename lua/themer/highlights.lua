local M = {}

local function set(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

function M.apply(c)
    set("Normal", {
        fg = c.fg,
        bg = c.bg,
    })

    set("NormalFloat", {
        fg = c.fg,
        bg = c.float_bg,
    })

    set("FloatBorder", {
        fg = c.border,
        bg = c.float_bg,
    })

    set("FloatTitle", {
        fg = c.accent,
        bg = c.float_bg,
        bold = true,
    })

    set("CursorLine", {
        bg = c.cursorline,
    })

    set("Visual", {
        bg = c.visual,
    })

    set("LineNr", {
        fg = c.comment,
    })

    set("CursorLineNr", {
        fg = c.accent,
        bold = true,
    })

    set("Comment", {
        fg = c.comment,
        italic = true,
    })

    set("String", {
        fg = c.green,
    })

    set("Number", {
        fg = c.orange,
    })

    set("Boolean", {
        fg = c.orange,
    })

    set("Function", {
        fg = c.blue,
    })

    set("Keyword", {
        fg = c.magenta,
    })

    set("Type", {
        fg = c.yellow,
    })

    set("Constant", {
        fg = c.cyan,
    })

    set("DiagnosticError", {
        fg = c.red,
    })

    set("DiagnosticWarn", {
        fg = c.yellow,
    })

    set("DiagnosticInfo", {
        fg = c.blue,
    })

    set("DiagnosticHint", {
        fg = c.cyan,
    })

    set("@comment", {
        link = "Comment",
    })

    set("@string", {
        link = "String",
    })

    set("@number", {
        link = "Number",
    })

    set("@boolean", {
        link = "Boolean",
    })

    set("@function", {
        link = "Function",
    })

    set("@keyword", {
        link = "Keyword",
    })

    set("@type", {
        link = "Type",
    })

    set("@variable", {
        fg = c.fg,
    })
end

return M
