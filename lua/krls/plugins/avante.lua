-- Configuration path:
-- ~/.local/share/nvim/lazy/avante.nvim/lua/avante/config.lua
-- -> select the prefered provider: provider = "claude"
-- export ANTHROPIC_API_KEY=your-api-key
-- For OpenAI:
-- export OPENAI_API_KEY=your-api-key
-- For Azure OpenAI:
-- export AZURE_OPENAI_API_KEY=your-api-key

local isActive = false

if isActive then
	print("avante is enabled")
	return {
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp",      -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua",      -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	}
else
	print("avante is disable")
	return {}
end



-- deepseek config
--return {
--  {
--    "yetone/avante.nvim",
--    event = "VeryLazy",
--    lazy = false,
--    version = false, -- set this if you want to always pull the latest change
--    opts = {
--      provider = "openai",
--      auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
--      openai = {
--        endpoint = "https://api.deepseek.com/v1",
--        model = "deepseek-chat",
--        timeout = 30000, -- Timeout in milliseconds
--        temperature = 0,
--        max_tokens = 4096,
--        -- optional
--        api_key_name = "OPENAI_API_KEY",  -- default OPENAI_API_KEY if not set
--      },
--    },
--    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
--    build = "make",
--    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
--    dependencies = {
--      "nvim-treesitter/nvim-treesitter",
--      "stevearc/dressing.nvim",
--      "nvim-lua/plenary.nvim",
--      "MunifTanjim/nui.nvim",
--      --- The below dependencies are optional,
--      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--      "zbirenbaum/copilot.lua", -- for providers='copilot'
--      {
--        -- support for image pasting
--        "HakonHarnes/img-clip.nvim",
--        event = "VeryLazy",
--        opts = {
--          -- recommended settings
--          default = {
--            embed_image_as_base64 = false,
--            prompt_for_file_name = false,
--            drag_and_drop = {
--              insert_mode = true,
--            },
--            -- required for Windows users
--            use_absolute_path = true,
--          },
--        },
--      },
--      {
--        -- Make sure to set this up properly if you have lazy=true
--        'MeanderingProgrammer/render-markdown.nvim',
--        opts = {
--          file_types = { "markdown", "Avante" },
--        },
--        ft = { "markdown", "Avante" },
--      },
--    },
--  },
--}
