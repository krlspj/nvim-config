# Neovim 42 config

### This neovim configuration implements the 42header and the norminette

## Commands
set custom baground:
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
