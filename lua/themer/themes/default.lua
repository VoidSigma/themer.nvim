local M = {}

function M.colors()
    return {
        bg = "#1e1e2e",
        bg_alt = "#181825",
        float_bg = "#181825",

        fg = "#cdd6f4",
        muted = "#a6adc8",
        comment = "#7f849c",

        border = "#585b70",
        line_nr = "#6c7086",
        cursorline = "#25253a",
        visual = "#45475a",
        statusline = "#181825",

        red = "#f38ba8",
        orange = "#fab387",
        yellow = "#f9e2af",
        green = "#a6e3a1",
        cyan = "#94e2d5",
        sky = "#89dceb",
        blue = "#89b4fa",
        magenta = "#cba6f7",
        accent = "#cba6f7",

        diff_add = "#243c2b",
        diff_change = "#3f3823",
        diff_delete = "#492b35",
        diff_text = "#263a5c",
    }
end

return M
