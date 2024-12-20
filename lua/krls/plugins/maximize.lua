--vim.keymap.set('n', '<leader>mm', ':Maximize<CR>', { noremap = true, silent = true })
--
--return {
--	'declancm/maximize.nvim',
--	config = true,
--}

return {
  'declancm/maximize.nvim',
  config = function()
    -- Initialize the plugin
    require('maximize').setup()

    -- Now set the keymap after the plugin is initialized
    vim.keymap.set('n', '<leader>mm', ':Maximize<CR>', { noremap = true, silent = true })
  end
}
