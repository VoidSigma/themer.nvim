local M = {}

M.defaults = {
    enabled = false,
    theme = "default",

    global = {
        borders = "rounded",
        winblend = 0,

        termguicolors = true,
        background = "dark",

        cursorline = true,
        number = true,
        relativenumber = true,

        signcolumn = "yes",
        laststatus = 3,
        showmode = false,
    },
}

M.options = vim.deepcopy(M.defaults)

function M.setup(user_options)
    M.options = vim.tbl_deep_extend(
        "force",
        vim.deepcopy(M.defaults),
        user_options or {}
    )

    return M.options
end

return M
