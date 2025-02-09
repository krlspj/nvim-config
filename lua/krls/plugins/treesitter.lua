local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	"nvim-treesitter/playground",

	config = function()
		require 'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all"
			ensure_installed = { "javascript", "typescript", "c", "cpp", "lua", "rust", "go" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			autopairs = {
				enable = true,
			},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
--
-- Autocommand to enable Tree-sitter highlighting for Go files
-- `vim.schedule` ensures the command runs after all other queued tasks,
-- avoiding potential conflicts with other configurations or delayed theme application.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	once = true, -- recommended aproach to exec once
	callback = function()
		-- Schedule the execution to ensure it runs after other queued functions
		vim.schedule(function()
			print("[debug] TSEnable hightlight on go files")
			vim.cmd("TSEnable highlight")
		end)
	end,
})

-- use flag to run once
--local ts_hightlight_enabled = false
--vim.api.nvim_create_autocmd("FileType", {
--	pattern = "go",
--	once = true,
--	callback = function()
--		if not ts_hightlight_enabled then
--			-- Schedule the execution to ensure it runs after other queued functions
--			vim.schedule(function()
--				print("[debug] TSEnable hightlight on go files")
--				vim.cmd("TSEnable highlight")
--				ts_hightlight_enabled = true
--			end)
--		end
--	end,
--})
return { M }
