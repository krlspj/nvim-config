--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

-- Enable list mode and set characters to display
vim.opt.list = false
--vim.opt.listchars:append('eol:¬')
-- Additional listchars configuration
vim.opt.listchars:append('nbsp:·')
--vim.opt.listchars:append('tab:».')
vim.opt.listchars:append('trail:·')
vim.opt.listchars:append('space:·')
-- Define custom highlight groups for list characters

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
