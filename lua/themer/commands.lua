local util = require("themer.util")

local M = {}

function M.create(themer)
    vim.api.nvim_create_user_command("ThemerEnable", function()
        themer.enable()
    end, {
        desc = "Enable Themer",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerDisable", function()
        themer.disable()
    end, {
        desc = "Disable Themer",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerToggle", function()
        themer.toggle()
    end, {
        desc = "Toggle Themer",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerUse", function(args)
        themer.use(args.args)
    end, {
        nargs = 1,
        complete = function()
            return themer.list_themes()
        end,
        desc = "Apply a Themer theme",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerBorder", function(args)
        themer.set_border(args.args)
    end, {
        nargs = 1,
        complete = function()
            return vim.tbl_keys(util.borders)
        end,
        desc = "Set default floating-window border",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerBlend", function(args)
        themer.set_winblend(args.args)
    end, {
        nargs = 1,
        desc = "Set default float transparency from 0 to 100",
        force = true,
    })

    vim.api.nvim_create_user_command("ThemerStatus", function()
        local status = themer.status()

        util.notify(
            string.format(
                "enabled=%s | theme=%s | border=%s | winblend=%d",
                tostring(status.enabled),
                status.theme,
                status.borders,
                status.winblend
            )
        )
    end, {
        desc = "Show Themer status",
        force = true,
    })
end

return M
