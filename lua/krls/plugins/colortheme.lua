local function set_theme(theme_name)
	--local default_theme = "tokyonight-night"
	print("loading color theme: " .. theme_name)
	vim.cmd("colorscheme " .. theme_name)
end

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		set_theme("tokyonight")
	end,
})

return {
	{ "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
	{
		"morhetz/gruvbox",
		priority = 1000,
		config = function()
		end,
	},
	{ "folke/tokyonight.nvim" },
	{
		"Mofiqul/dracula.nvim",
		config = function()
			local dracula = require("dracula")
			dracula.setup({
				colors = {
					bg = "#1F1F1F",
				}
			})
		end,
	},
}
