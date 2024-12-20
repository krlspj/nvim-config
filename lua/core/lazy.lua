local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then --.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- see `:help mapleader`
--  Note: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--require("lazy").setup(plugins, opts)
require("lazy").setup({
	{ import = "plugins" },

})

require("config.set")
require("config.remap")
require("config.colortheme")
--require("config.lsp-zero") -- @deprecated
require("config.telescope")
require("config.treesitter")
require("config.42header")
require("config.norminette")
require("config.maximize")
require("config.copilot")

-- setup must be called before loading
--vim.cmd.colorscheme "catppuccin"
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme retrobox")
--vim.cmd("colorscheme tokyonight-storm")

--require("lazy").setup({
--	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--})


