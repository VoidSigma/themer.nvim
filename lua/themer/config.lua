local M = {}

M.defaults = {
    enabled = false,
    theme = "default",

    global = {
        borders = "single",
        winblend = 5,

        termguicolors = true,
        background = "light",

        cursorline = true,
        number = true,
        relativenumber = true,

        signcolumn = "yes",
        laststatus = 3,
        showmode = false,

        diagnostic = {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        },
    },

    integrations = {
        telescope = true,
        cmp = true,
        gitsigns = true,
        which_key = true,
        neo_tree = true,
    },
}

local options = vim.deepcopy(M.defaults)

function M.setup(user_options)
    options = vim.tbl_deep_extend(
        "force",
        vim.deepcopy(M.defaults),
        user_options or {}
    )

    return options
end

function M.get()
    return options
end

return M
