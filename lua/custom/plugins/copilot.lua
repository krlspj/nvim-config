local isActive = false

if isActive then
  print 'Copilot is enabled'
  return {
    -- ** COPILOT **
    {
      'github/copilot.vim',
      config = function()
        vim.g.copilot_filetypes = { markdown = false, xml = true }

        -- default next for copilot is Alt+] and previous is Alt+[
        --
        -- vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        -- vim.api.nvim_set_keymap("i", "<C-[>", 'copilot#Previous()', { silent = true, expr = true })
        -- vim.api.nvim_set_keymap("i", "<C-]>", 'copilot#Next()', { silent = true, expr = true })
      end,
    },
    -- ** COPILOT - CHAT **
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
        { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log wrapper
      },
      build = 'make tiktoken', -- Only on MacOS or Linux
      opts = {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
  }
else
  print 'copilot is disable'
  return {}
end
