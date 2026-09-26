local M = {}

function M.create(themer)
    vim.api.nvim_create_user_command("ThemerEnable", function()
        themer.enable()
    end, {
        desc = "Enable Themer",
    })

    vim.api.nvim_create_user_command("ThemerDisable", function()
        themer.disable()
    end, {
        desc = "Disable Themer",
    })

    vim.api.nvim_create_user_command("ThemerToggle", function()
        themer.toggle()
    end, {
        desc = "Toggle Themer",
    })

    vim.api.nvim_create_user_command("ThemerUse", function(args)
        themer.use(args.args)
    end, {
        nargs = 1,
        desc = "Apply a Themer theme",
    })

    vim.api.nvim_create_user_command("ThemerBorder", function(args)
        themer.set_border(args.args)
    end, {
        nargs = 1,
        desc = "Set default float border",
    })

    vim.api.nvim_create_user_command("ThemerBlend", function(args)
        themer.set_winblend(args.args)
    end, {
        nargs = 1,
        desc = "Set default float transparency",
    })
end

return M
