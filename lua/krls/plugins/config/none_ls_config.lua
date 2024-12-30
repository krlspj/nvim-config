local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
	sources = {
	-- ensure installed prettier: npm install -g prettier
	--	null_ls.builtins.formatting.prettier,
	},
	on_attach = function(client, bufnbr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnbr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnbr,
				callback = function ()
					vim.lsp.buf.format({ bufnr = bufnbr})
				end,
			})
		end
	end
}

return opts
