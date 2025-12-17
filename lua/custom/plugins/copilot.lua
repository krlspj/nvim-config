local enabled = (vim.env.COPILOT_ENABLED == 'true')

if not enabled then
  --print 'copilot is disable'
  return {}
else
  print 'Copilot is enabled'
  return {
    'zbirenbaum/copilot.lua',
    requires = {
      'copilotlsp-nvim/copilot-lsp', -- optional for NES functionality
    },
    event = 'InsertEnter', -- lazy load on insert
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = { position = 'bottom', ratio = 0.4 },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false, -- you can set true if you want immediate inline hints
          hide_during_completion = true,
        },
        -- optional: if you want to try selecting a completion model (experimental)
        -- copilot_model = 'gpt-4o-copilot',
        -- see discussion/issues about model selection for copilot.lua usage.
      }
      -- common keymaps: accept suggestion with Tab in insert
      vim.api.nvim_set_keymap('i', '<Tab>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
      -- previous/next suggestion (if needed)
      vim.api.nvim_set_keymap('i', '<M-[>', 'copilot#Previous()', { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<M-]>', 'copilot#Next()', { expr = true, silent = true })
    end,

    -- Copilot Chat (ask/edit/agent, model selection, diffs, apply/discard)
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'nvim-lua/plenary.nvim', branch = 'master' },
      },
      build = 'make tiktoken', -- optional but recommended for token counting
      config = function()
        -- default setup; tune opts as you like
        require('CopilotChat').setup {
          -- model = 'gpt-5-mini',
          -- keep default options; plugin provides commands and keymaps listed below
        }

        -- convenience mappings:
        -- open chat prompt (ask)
        vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChat<CR>', { desc = 'CopilotChat - open' })
        -- open model selector
        vim.keymap.set('n', '<leader>cm', '<cmd>CopilotChatModels<CR>', { desc = 'CopilotChat - models' })
        -- toggle chat window
        vim.keymap.set('n', '<leader>co', '<cmd>CopilotChatToggle<CR>', { desc = 'CopilotChat - toggle' })
        -- Accept nearest diff from chat output
        vim.keymap.set(
          'n',
          '<leader>ca',
          "<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-y>', true, false, true), 'n', true)<CR>",
          { desc = 'CopilotChat - accept nearest diff' }
        )
      end,
    },
  }
end
