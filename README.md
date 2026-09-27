# themer.nvim

A small Lua Neovim theme engine with central global UI options.

## Requirements

- Neovim 0.11 or newer

## Lazy.nvim

## Commands

- `:ThemerEnable`
- `:ThemerDisable`
- `:ThemerToggle`
- `:ThemerUse default`
- `:ThemerUse midnight`
- `:ThemerUse light`
- `:ThemerBorder rounded`
- `:ThemerBlend 15`
- `:ThemerStatus`

## Lua API

```lua
local themer = require("themer")

themer.use("midnight")
themer.set_border("double")
themer.set_winblend(15)
```
