return {
	{
		"vinicius507/header42.nvim",
		config = function()
			local header = require('header42')
			header.setup({
				login = "cpujades",
				email = "cpujades@student.42barcel",
			})
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		--opts = {}, -- this is equalent to setup({}) function
		config = function()
			require('nvim-autopairs').setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				disable_in_macro = false,             -- disable when recording or executing a macro
				disable_in_visualblock = false,       -- disable when insert after visual block mode
				disable_in_replace_mode = true,       -- disable in replace mode
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=], -- characters that will not trigger autopairing
				enable_moveright = true,              -- move the cursor to the right after the pair is added
				enable_afterquote = true,             -- add bracket pairs after quote
				enable_check_bracket_line = true,     -- check brackets in the same line
				enable_bracket_in_quote = true,       -- allow brackets inside quotes
				enable_abbr = false,                  -- trigger abbreviation
				break_undo = true,                    -- enable undo break after pair insertion
				check_ts = false,                     -- not using Treesitter for pair checking
				map_cr = true,                        -- map <CR> key to insert pair
				map_bs = true,                        -- map <BS> key to delete pair
				map_c_h = false,                      -- map <C-h> to delete pair
				map_c_w = false,                      -- map <C-w> to delete pair
			})
		end,
	},
}
