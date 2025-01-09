return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-p>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		-- set keymap
		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cw" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under curson in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<C-p>", builtin.grep_string, {})

		vim.api.nvim_create_user_command('TodoTelescope', function()
			builtin.live_grep({
				default_text = "// todo",
				search = "TODO",
				--search = "//\\s*(TODO|todo)(:?.*)?", -- search for TODOs
				prompt_title = "Search TODOs",
			})
		end, { desc = "Search for TODO comments" })
	end
}
--return {
--    'nvim-telescope/telescope.nvim', tag = '0.1.8',
---- or                              , branch = '0.1.x',
--      dependencies = { 'nvim-lua/plenary.nvim' },
--	  config = function()
--		local builtin = require('telescope.builtin')
--		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--		vim.keymap.set('n', '<leader>ps', function()
--			builtin.grep_string({ search = vim.fn.input("Grep > ") })
--		end)
--		vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
--	  end
--}
