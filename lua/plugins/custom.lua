return {
	-- LSP Configuration
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "ts_ls", "jsonls", "rust_analyzer", "clangd", "gopls" },
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
			-- LSP server configurations
			local servers = {
				lua_ls = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				},
				ts_ls = {},
				jsonls = {},
				rust_analyzer = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
				clangd = {},
				gopls = {},
			}

			-- LSP keymaps and attach configuration
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end

			-- Get capabilities from cmp_nvim_lsp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Setup each LSP server
			for server, opts in pairs(servers) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = opts,
				})
			end

			-- Diagnostic configuration
			vim.diagnostic.config({
				float = {
					border = "rounded",
					-- You can customize colors too:
					-- header = "",  -- Remove the 'Diagnostics:' header
					-- prefix = "",  -- Remove the '[E]', '[W]' etc. prefixes
					-- source = "always",  -- Always show source
				},
				virtual_text = true,
				signs = {
					text = {
						error = 'E',
						warn = 'W',
						hint = 'H',
						info = 'I'
					}
				}
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover, {
					border = "rounded",
					-- You can add other styling like:
					-- width = 60,  -- Max width of the hover window
					-- height = 30  -- Max height of the hover window
				}
			)

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help, {
					border = "rounded"
				}
			)

			vim.cmd([[
				highlight FloatBorder guifg=#89b4fa
				highlight NormalFloat guibg=#1e1e2e
			]])

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
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},

	-- None-ls (optional, for additional formatters/linters)
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("config.none-ls")
		end,
	},
}




--local servers = {
--	--lua_ls = {
--	--  Lua = {
--	--    workspace = { checkThirdParty = false },
--	--    telemetry = { enable = false },
--	--  },
--	--},
--	lua_ls = {},
--	ts_ls = {},
--	jsonls = {},
--	rust_analyzer = {
--		["rust-analyzer"] = {
--			checkOnSave = {
--				command = "clippy",
--			},
--		},
--	},
--	clangd = {},
--	gopls = {},
--}
--
--local lsp_config = {
--	{
--		{
--			"williamboman/mason.nvim",
--			opts = {},
--			--config = function()
--			--	require("config....")
--			--end,
--		},
--		{
--			"williamboman/mason-lspconfig.nvim",
--			opts = {
--				ensure_installed = vim.tbl_keys(servers),
--			},
--		},
--		{
--			"neovim/nvim-lspconfig",
--			dependencies = {
--				--{ 'hrsh7th/nvim-cmp' },		-- required
--				--{ 'hrsh7th/cmp-nvim-lsp' },	-- required
--				{ 'L3MON4D3/LuaSnip' }, -- required
--			},
--			config = function()
--				-- Get the completion capabilities of cmp-nvim-lsp
--				local capabilities = require("cmp_nvim_lsp").default_capabilities()
--				-- For each LSP listed at the top of the file, call the its setup function
--				-- with its settings and the completion capabilities of cmp-nvim-lsp
--				for server, server_opts in pairs(servers) do
--					require("lspconfig")[server].setup({
--						capabilities = capabilities,
--						settings = server_opts,
--					})
--				end
--			end,
--		}
--	},
--	{
--		"nvimtools/none-ls.nvim",
--		event = "VeryLazy",
--		opts = function()
--			return require("config.none-ls")
--		end,
--	},
--}
--
--local nvim_cmp = {
--	"hrsh7th/nvim-cmp",
--	dependencies = {
--		-- nvim-cmp doesn't contain any completions, its only job is display and expand them.
--		-- cmp-nvim-lsp is a source of completions that will inject completions from the LSP
--		-- attached to the current buffer into nvim-cmp
--		"hrsh7th/cmp-nvim-lsp",
--	},
--	config = function()
--		local cmp = require("cmp")
--		local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
--		cmp.setup({
--			-- Make the popup menus bordered
--			window = {
--				--completion = cmp.config.window.bordered(),
--				--documentation = cmp.config.window.bordered(),
--			},
--			mapping = cmp.mapping.preset.insert({
--				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--				['<C-y>'] = cmp.mapping.confirm({ select = true }),
--				["<C-Space>"] = cmp.mapping.complete(),
--
--				--['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--				--['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--				--['<C-y>'] = cmp.mapping.confirm({ select = true }),
--				--["<C-Space>"] = cmp.mapping.complete(),
--			}),
--			--			mapping = cmp.mapping.preset.insert({
--			--				["<C-b>"] = cmp.mapping.scroll_docs(-4),
--			--				["<C-f>"] = cmp.mapping.scroll_docs(4),
--			--				["<C-Space>"] = cmp.mapping.complete(),
--			--				["<C-e>"] = cmp.mapping.abort(),
--			--				["<CR>"] = cmp.mapping.confirm({ select = true }),
--			--			}),
--			sources = cmp.config.sources({
--				{ name = "nvim_lsp" }, -- Declare cmp-nvim-lsp as a source of completions for nvim-cmp
--			}, {
--				--{ name = "luasnip" },
--				{ name = "buffer" },
--			}),
--		})
--	end,
--}
--
--return { lsp_config,
--	nvim_cmp,
--}
