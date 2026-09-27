local M = {}

local function set(group, spec)
    vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
    set(group, { link = target })
end

function M.apply(c)
    set("Normal", { fg = c.fg, bg = c.bg })
    set("NormalNC", { fg = c.fg, bg = c.bg })

    set("NormalFloat", { fg = c.fg, bg = c.float_bg })
    set("FloatBorder", { fg = c.border, bg = c.float_bg })
    set("FloatTitle", { fg = c.accent, bg = c.float_bg, bold = true })

    set("CursorLine", { bg = c.cursorline })
    set("ColorColumn", { bg = c.bg_alt })
    set("Visual", { bg = c.visual })

    set("LineNr", { fg = c.line_nr })
    set("CursorLineNr", { fg = c.accent, bold = true })
    set("SignColumn", { fg = c.line_nr, bg = c.bg })

    set("WinSeparator", { fg = c.border, bg = c.bg })
    link("VertSplit", "WinSeparator")

    set("StatusLine", { fg = c.fg, bg = c.statusline })
    set("StatusLineNC", { fg = c.muted, bg = c.statusline })

    set("Pmenu", { fg = c.fg, bg = c.float_bg })
    set("PmenuSel", { fg = c.bg, bg = c.accent })
    set("PmenuSbar", { bg = c.bg_alt })
    set("PmenuThumb", { bg = c.border })

    set("Search", { fg = c.bg, bg = c.yellow })
    set("IncSearch", { fg = c.bg, bg = c.orange })
    set("Substitute", { fg = c.bg, bg = c.red })

    set("Comment", { fg = c.comment, italic = true })
    set("Constant", { fg = c.cyan })
    set("String", { fg = c.green })
    set("Character", { fg = c.green })
    set("Number", { fg = c.orange })
    set("Boolean", { fg = c.orange })
    set("Float", { fg = c.orange })

    set("Identifier", { fg = c.blue })
    set("Function", { fg = c.blue })

    set("Statement", { fg = c.magenta })
    set("Conditional", { fg = c.magenta })
    set("Repeat", { fg = c.magenta })
    set("Label", { fg = c.magenta })
    set("Operator", { fg = c.sky })
    set("Keyword", { fg = c.magenta })
    set("Exception", { fg = c.red })

    set("PreProc", { fg = c.magenta })
    set("Include", { fg = c.magenta })
    set("Define", { fg = c.magenta })
    set("Macro", { fg = c.magenta })
    set("PreCondit", { fg = c.magenta })

    set("Type", { fg = c.yellow })
    set("StorageClass", { fg = c.yellow })
    set("Structure", { fg = c.yellow })
    set("Typedef", { fg = c.yellow })

    set("Special", { fg = c.cyan })
    set("SpecialChar", { fg = c.cyan })
    set("Tag", { fg = c.red })
    set("Delimiter", { fg = c.fg })
    set("SpecialComment", { fg = c.comment, italic = true })

    set("Error", { fg = c.red })
    set("ErrorMsg", { fg = c.red })
    set("WarningMsg", { fg = c.yellow })
    set("Todo", { fg = c.yellow, bg = c.bg_alt, bold = true })

    set("DiagnosticError", { fg = c.red })
    set("DiagnosticWarn", { fg = c.yellow })
    set("DiagnosticInfo", { fg = c.blue })
    set("DiagnosticHint", { fg = c.cyan })
    set("DiagnosticOk", { fg = c.green })

    set("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
    set("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
    set("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
    set("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

    set("DiffAdd", { fg = c.green, bg = c.diff_add })
    set("DiffChange", { fg = c.yellow, bg = c.diff_change })
    set("DiffDelete", { fg = c.red, bg = c.diff_delete })
    set("DiffText", { fg = c.blue, bg = c.diff_text, bold = true })

    link("@comment", "Comment")
    link("@constant", "Constant")
    link("@string", "String")
    link("@character", "Character")
    link("@number", "Number")
    link("@boolean", "Boolean")
    link("@float", "Float")

    link("@function", "Function")
    link("@function.call", "Function")
    link("@method", "Function")
    link("@method.call", "Function")

    link("@keyword", "Keyword")
    link("@keyword.function", "Keyword")
    link("@keyword.return", "Keyword")
    link("@conditional", "Conditional")
    link("@repeat", "Repeat")
    link("@operator", "Operator")

    link("@type", "Type")
    link("@type.builtin", "Type")

    set("@variable", { fg = c.fg })
    set("@variable.builtin", { fg = c.red })
    set("@parameter", { fg = c.fg })
    set("@property", { fg = c.fg })
    set("@field", { fg = c.fg })

    set("@punctuation.delimiter", { fg = c.muted })
    set("@punctuation.bracket", { fg = c.muted })

    set("@tag", { fg = c.red })
    set("@tag.attribute", { fg = c.yellow })
    set("@tag.delimiter", { fg = c.muted })
end

return M
