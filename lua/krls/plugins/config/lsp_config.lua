local M = {}

-- configure golang build tags
local build_tags = os.getenv("GO_BUILD_TAGS")
local gopls_settings = {}

if build_tags then
  gopls_settings = {
    gopls = {
      buildFlags = { "-tags=" .. build_tags },
    },
  }
end

M.setup = function()
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
		gopls = gopls_settings,
		--gopls = {
		--	gopls = {
		--		buildFlags = { "-tags=auditlog debug" },
		--		-- dynamic  buildFlags = { "-tags=" .. (os.getenv("GO_BUILD_TAGS") or "auditlog debug") },
		--	},
		--},
		eslint = {},
	}

	-- LSP keymaps and attach configuration
	local on_attach = function(client, bufnr)
		_ = client
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
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

	-- Special case: gopls needs custom setup to apply buildFlags correctly
	-- ** breaks the functionality <leader>vd -> review it before apply ** !!
	--require("lspconfig").gopls.setup({
	--	capabilities = capabilities,
	--	settings = {
	--		gopls = {
	--			buildFlags = { "-tags=debug,auditlog" }
	--		},
	--	},
	--})

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

	-- Set a custom highlight for the border
	--	vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ff6347', bg = '#1e1e2e' })
	--	vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#ff6347', bg = '#1e1e2e' })
	--	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff8800", bg = "#1e1e2e" }) -- Orange border
	--	highlight FloatBorder guifg=#89b4fa
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover, {
			--border = "rounded",
			border = "single",
			--border_highlight = "FloatBorderCustom"
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
end

return M
