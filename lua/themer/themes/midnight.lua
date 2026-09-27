local M = {}

function M.colors()
    return {
        bg = "#0b1020",
        bg_alt = "#11182d",
        float_bg = "#11182d",

        fg = "#d8e1ff",
        muted = "#8f9bb3",
        comment = "#64748b",

        border = "#2b385a",
        line_nr = "#41506f",
        cursorline = "#16203a",
        visual = "#26375e",
        statusline = "#11182d",

        red = "#ff7b95",
        orange = "#ffb86c",
        yellow = "#f1fa8c",
        green = "#8be9a8",
        cyan = "#8be9fd",
        sky = "#6cb6ff",
        blue = "#82aaff",
        magenta = "#c792ea",
        accent = "#82aaff",

        diff_add = "#173d32",
        diff_change = "#453a20",
        diff_delete = "#4a2733",
        diff_text = "#1e3d69",
    }
end

return M
