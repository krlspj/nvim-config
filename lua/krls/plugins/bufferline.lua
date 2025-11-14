return {
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}
--[[ 
return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
		{ "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
		{ "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
		{ "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
	},
	opts = {
		options = {
			-- use built-in bdelete instead of Snacks
			close_command = function(n) vim.cmd("bdelete! " .. n) end,
			right_mouse_command = function(n) vim.cmd("bdelete! " .. n) end,

			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			diagnostics_indicator = function(_, _, diag)
				local icons = vim.g.icons or {} -- fallback if no global icons table
				local ret = (diag.error and (icons.Error or "✖") .. diag.error .. " " or "")
					.. (diag.warning and (icons.Warn or "⚠") .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "snacks_layout_box",
				},
			},
			get_element_icon = function(opts)
				local devicons = require("nvim-web-devicons")
				return devicons.get_icon(opts.filetype, nil, { default = true })
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		-- session restore fix
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function() pcall(nvim_bufferline) end)
			end,
		})
	end,
}

--]]
