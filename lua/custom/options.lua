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
