# themer.nvim

A centralized UI styling layer for Neovim.

`themer.nvim` provides an abstraction layer for configuring the appearance of Neovim and its plugins from one place. It centralizes supported UI and styling options such as colors, highlights, borders, floating windows, popups, panels, dialogs, and transparency.

Instead of maintaining the same visual settings across multiple plugin configurations, define a common style with `themer.nvim` and apply it wherever the relevant UI options are supported.

The goal is to provide a consistent visual hierarchy across Neovim without requiring each plugin to be configured independently.

## Requirements

* Neovim 0.11 or newer

## lazy.nvim

```lua
{
    "voidsigma/themer.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("themer").setup()
    end,
}
```

## Commands

```vim
:ThemerEnable
:ThemerDisable
:ThemerToggle

:ThemerUse default
:ThemerUse midnight
:ThemerUse light

:ThemerBorder rounded
:ThemerBlend 15

:ThemerStatus
```

## Lua API

```lua
local themer = require("themer")

themer.use("midnight")
themer.set_border("double")
themer.set_winblend(15)
```

## Configuration

```lua
require("themer").setup({
    theme = "midnight",
    border = "rounded",
    winblend = 15,
})
```

## Scope

Themer is designed to provide shared styling primitives for Neovim and plugins that expose configurable UI options.

It can be used to centralize styles for:

* Colors and highlights
* Borders
* Floating windows
* Popups
* Panels
* Dialogs
* Completion menus
* Notifications
* Other plugin UI

Plugin-specific UI remains controlled by the plugin itself unless the plugin exposes compatible options or a themer integration is provided.

## Design

```text
                    themer.nvim
                         │
              Centralized UI Style
                         │
        ┌────────────────┼────────────────┐
        │                │                │
      Colors           Borders          UI Rules
        │                │                │
        └────────────────┼────────────────┘
                         │
                 Neovim + Plugins
```

Define the visual language once and reuse it throughout the editor.
