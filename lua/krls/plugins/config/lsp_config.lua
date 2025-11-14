local M = {}



-- skip nomodelines (until 5)
-- configure golang build tags ; ex: export GO_BUILD_TAGS="debug auditlog"
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

	-- -------------------------------------------------------------------------
	-- Lua
	-- -------------------------------------------------------------------------
	vim.lsp.config.lua_ls = {
		capabilities = capabilities,
		on_attach    = on_attach,
		settings     = {
			Lua = {
				diagnostics = { globals = { 'vim' } },
			},
		},
	}
	vim.lsp.enable 'lua_ls'

	-- -------------------------------------------------------------------------
	-- Go
	-- -------------------------------------------------------------------------
	vim.lsp.config.gopls = {
		capabilities = capabilities,
		on_attach    = on_attach,
		setings      = gopls_settings,
	}
	vim.lsp.enable 'gopls'

	-- -------------------------------------------------------------------------
	-- C/C++/CUDA/tpp
	-- -------------------------------------------------------------------------
	vim.lsp.config.clangd = {
		capabilities = capabilities,
		on_attach    = on_attach,
		filetypes    = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'tpp' },
	}
	vim.lsp.enable 'clangd'

	-- -------------------------------------------------------------------------
	-- Rust
	-- -------------------------------------------------------------------------
	vim.lsp.config.rust_analyzer = {
		capabilities = capabilities,
		on_attach    = on_attach,
		settings     = {
			['rust-analyzer'] = {
				checkOnSave = {
					command = 'clippy', -- <-- use 'clippy' or 'cargo check'
				},
			},
		},
	}
	vim.lsp.enable 'rust_analyzer'

	-- -------------------------------------------------------------------------
	-- eslint
	-- -------------------------------------------------------------------------
	vim.lsp.enable 'eslint'
	-- -------------------------------------------------------------------------
	-- ts_ls
	-- -------------------------------------------------------------------------
	vim.lsp.enable 'ts_ls'
	-- -------------------------------------------------------------------------
	-- jsonls
	-- -------------------------------------------------------------------------
	vim.lsp.enable 'jsonls'

	-- …add more servers the same way…

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
