vim.keymap.set('n', '<leader>vd', function()
  vim.diagnostic.open_float { border = 'rounded' }
end, { desc = '[V]iew [D]iagnostic' })

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })

-- treat tpp files as cpp
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.tpp',
  callback = function()
    vim.bo.filetype = 'cpp'
  end,
})

-- configure golang build tags ; ex: export GO_BUILD_TAGS="debug auditlog"
local build_tags = vim.env.GO_BUILD_TAGS
if build_tags then
  vim.lsp.config.gopls = {
    settings = {
      gopls = {
        buildFlags = { '-tags=' .. build_tags },
      },
    },
  }
  vim.lsp.enable 'gopls'
end

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- load color scheme
vim.cmd.colorscheme 'tokyonight-night'

-- INFO: remaps ---
-- right now using autopair plugin
-- vim.keymap.set('i', '{', '{}<Left>')
-- vim.keymap.set("i", "(", "()<Left>")
-- vim.keymap.set("i", "[", "[]<Left>")

-- INFO: telescope extra keymaps
-- Search only inside the folder Nvim-tree is focussed on
-- search FILES inside the netrw directory

vim.keymap.set('n', '<leader>sF', function()
  -- netrw exposes the current banner directory in b:netrw_curdir
  local cwd = vim.b.netrw_curdir or vim.loop.cwd()
  require('telescope.builtin').find_files {
    cwd = cwd,
    prompt_title = 'Files in ' .. vim.fn.fnamemodify(cwd, ':t'),
  }
end, { desc = '[S]earch [F]iles in netrw dir' })

-- LIVE-GREP inside the netrw directory
vim.keymap.set('n', '<leader>sG', function()
  local cwd = vim.b.netrw_curdir or vim.loop.cwd()
  require('telescope.builtin').live_grep {
    cwd = cwd,
    prompt_title = 'Grep in ' .. vim.fn.fnamemodify(cwd, ':t'),
  }
end, { desc = '[S]earch by [G]rep in netrw dir' })
