local M = {}

M.setup = function()
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
end

return M
