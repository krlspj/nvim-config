--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.wrap = true

-- Set case-insensitive search
vim.o.ignorecase = true
-- Enable smart case: case-sensitive if uppercase is used in search
vim.o.smartcase = true

-- Enable list mode and set characters to display
vim.opt.list = false
--vim.opt.listchars:append('eol:¬')
-- Additional listchars configuration
vim.opt.listchars:append('nbsp:·')
--vim.opt.listchars:append('tab:».')
vim.opt.listchars:append('trail:·')
vim.opt.listchars:append('space:·')
-- Define custom highlight groups for list characters

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- run rust formtter when save file
vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.format()")

-- format js, ts, jsx, tsx files with prettier
-- Create an augroup for Prettier formatting
--vim.api.nvim_create_augroup("PrettierFormatting", { clear = true })
--
---- Function to get project root (looks for package.json)
--local function get_project_root()
--	local current = vim.fn.expand('%:p:h')
--	local parent = current
--
--	-- Keep going up until we find package.json or hit root
--	while parent ~= '' do
--		if vim.fn.filereadable(parent .. '/package.json') == 1 then
--			return parent
--		end
--		parent = vim.fn.fnamemodify(parent, ':h')
--	end
--	return nil
--end
--
---- Function to format using Prettier
--local function format_with_prettier()
--	-- Write buffer to file first
--	vim.cmd('write')
--
--	-- Get the file path
--	local file_path = vim.fn.expand('%:p')
--	local cursor_pos = vim.fn.getcurpos()
--
--	-- Try to get project root
--	local project_root = get_project_root()
--	local format_command = project_root and
--		string.format('cd %s && npx prettier --write %s', vim.fn.shellescape(project_root), vim.fn.shellescape(file_path)) or
--		string.format('prettier --write %s', vim.fn.shellescape(file_path))
--
--	local output = vim.fn.system(format_command .. ' 2>/dev/null')
--
--	if vim.v.shell_error ~= 0 then
--		vim.notify(
--		'Prettier formatting failed. Make sure prettier is installed (npm i -D prettier or npm i -g prettier)',
--			vim.log.levels.ERROR)
--		return
--	end
--
--	-- Reload the buffer to show the formatted content
--	vim.cmd('edit!')
--
--	-- Restore cursor position
--	vim.fn.setpos('.', cursor_pos)
--end
--
---- Create autocmds for supported file types
--local file_patterns = {
--	"javascript",
--	"javascriptreact",
--	"typescript",
--	"typescriptreact",
--	"vue",
--	"css",
--	"scss",
--	"less",
--	"html",
--	"json",
--	"jsonc",
--	"yaml",
--	"markdown",
--	"graphql",
--	"handlebars"
--}
--
--vim.api.nvim_create_autocmd("FileType", {
--	group = "PrettierFormatting",
--	pattern = file_patterns,
--	callback = function()
--		-- Create command for manual formatting
--		vim.api.nvim_buf_create_user_command(0, "Prettier", format_with_prettier, {})
--
--		-- Format on save
--		vim.api.nvim_create_autocmd("BufWritePost", {
--			group = "PrettierFormatting",
--			buffer = 0,
--			callback = format_with_prettier
--		})
--	end
--})
