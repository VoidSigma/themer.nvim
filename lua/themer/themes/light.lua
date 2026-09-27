local M = {}

function M.colors()
    return {
        bg = "#eff1f5",
        bg_alt = "#e6e9ef",
        float_bg = "#e6e9ef",

        fg = "#4c4f69",
        muted = "#6c6f85",
        comment = "#8c8fa1",

        border = "#9ca0b0",
        line_nr = "#9ca0b0",
        cursorline = "#dce0e8",
        visual = "#bcc0cc",
        statusline = "#dce0e8",

        red = "#d20f39",
        orange = "#fe640b",
        yellow = "#df8e1d",
        green = "#40a02b",
        cyan = "#179299",
        sky = "#04a5e5",
        blue = "#1e66f5",
        magenta = "#8839ef",
        accent = "#8839ef",

        diff_add = "#d7f5d0",
        diff_change = "#f8e3b2",
        diff_delete = "#f8d7da",
        diff_text = "#cfe8ff",
    }
end

return M
