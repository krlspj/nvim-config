return {
	-- LSP Configuration
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"jsonls",
				"rust_analyzer",
				"clangd",
				"gopls",
				"eslint",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("krls.plugins.config.lsp_config").setup()
		end,
	},

	-- Completion Configuration
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("krls.plugins.config.cmp_config").setup()
		end,
	},

	-- None-ls (optional, for additional formatters/linters)
	-- ensure installed prettier to use the formatter:
	-- npm install -g prettier
	--{
	--	"nvimtools/none-ls.nvim",
	--	event = "VeryLazy",
	--	opts = function()
	--		return require("krls.plugins.config.none_ls_config")
	--	end,
	--},
}
