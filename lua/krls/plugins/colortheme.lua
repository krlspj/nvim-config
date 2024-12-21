local function set_theme()
	local default_theme = "tokyonight-night"
	print("loading color theme: " .. default_theme)
	vim.cmd("colorscheme " .. default_theme)
end


return {
	{ "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
	{
		"morhetz/gruvbox",
		priority = 1000,
		config = set_theme,
	},
	{ "folke/tokyonight.nvim" },
	{ "dracula/vim" },
}
