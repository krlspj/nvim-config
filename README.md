# Neovim 42 config

### This neovim configuration implements the 42header and the norminette

## Commands
* set custom baground:
```
:highlight Normal guibg=#1F1F1F
```
* configure custom background
```
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
```
* configure custom background for theme
```
require("dracula").setup({
    colors = {
        bg = "#000000", -- Set a custom darker background color
    },
})
vim.cmd("colorscheme dracula")
```
* special chars
```
vim.cmd([[
  highlight SpecialChar guifg=#ff5555 ctermfg=9
]])
-- or
require("dracula").setup({
  overrides = {
    SpecialChar = { fg = "#ff5555" }, -- Adjust this to a color that stands out.
  },
})
```
