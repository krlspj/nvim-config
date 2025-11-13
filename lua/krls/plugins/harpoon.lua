return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",               -- v2 API
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})                -- required
  end,
  keys = {
    -- mark / un-mark current file
    { "<leader>a", function() require("harpoon"):list():add() end,
      desc = "Harpoon add file" },
    -- toggle quick-menu
    { "<leader>o", function() require("harpoon"):list():toggle_quick_menu() end,
      desc = "Harpoon quick menu" },
    -- jump to marks 1-4  (change keys to taste)
    { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
    { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
    { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
    { "<C-l>", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
  },
}
