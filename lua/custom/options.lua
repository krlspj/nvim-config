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
-- set column
--vim.opt.colorcolumn = '120'
vim.opt.colorcolumn = '80'

-- INFO: remaps ---
-- right now using autopair plugin
-- vim.keymap.set('i', '{', '{}<Left>')
-- vim.keymap.set("i", "(", "()<Left>")
-- vim.keymap.set("i", "[", "[]<Left>")

-- INFO: telescope extra keymaps
-- Search only inside the folder Nvim-tree is focussed on
-- search FILES inside the netrw directory

vim.api.nvim_create_user_command('LGHere', function()
  require('telescope.builtin').live_grep {
    cwd = vim.fn.expand '%:p:h',
  }
end, {})

-- Search in current file's directory
vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').live_grep {
    cwd = vim.fn.expand '%:p:h',
  }
end)

-- Or for find_files
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.expand '%:p:h',
  }
end)

-- Optionally, add more keymaps:
vim.keymap.set('n', '<leader>fh', function()
  print('File directory: ' .. vim.fn.expand '%:p:h')
end, { desc = 'Show file directory path' })

--
-- Add which-key specifications AFTER your keymaps
-- Add this at the END of your file
local wk = require 'which-key'
wk.add {
  -- Group name (prefix)
  { '<leader>f', group = 'File directory' },

  { '<leader>fg', desc = 'Live grep in file directory' },
  { '<leader>ff', desc = 'Find files in file directory' },
  { '<leader>fh', desc = 'Show file directory path' },

  -- Another group
  { '<leader>c', group = 'Code' },
}
