local function set_theme(theme_name)
	--local default_theme = "tokyonight-night"
	print("[debug] loading color theme: " .. theme_name)
	vim.cmd("colorscheme " .. theme_name)
end

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		--set_theme("tokyonight")
		set_theme("retrobox")
		--set_theme("unokai")
	end,
})
-- this is a comment
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
				--variant = "soft",
				colors = {
					bg = "#1F1F1F",
				},
				overrides = {
					CursorLine = { bg = "#2a2a2a" },
					SpecialChar = { fg = "#ff5555" },
					Special = { fg = "#09ff00", bold = false },
					-- SpecialChar = { fg = "#00ffee" },
				},

			})
		end,
	},
}
