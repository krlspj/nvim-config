-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

--local foo = function()
--  print 'hello from autopairs'
--end
--foo()
return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'declancm/maximize.nvim',
    config = function()
      -- Initialize the plugin
      require('maximize').setup()

      -- Now set the keymap after the plugin is initialized
      vim.keymap.set('n', '<leader>mm', ':Maximize<CR>', { noremap = true, silent = true })
    end,
  },
}
