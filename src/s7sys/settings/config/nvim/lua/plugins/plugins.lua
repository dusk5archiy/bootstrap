return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		},
	},
	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	-- dashboard
	{
		"snacks.nvim",
		opts = {
			dashboard = {
				formats = {
					footer = { "%s", align = "center" },
					cache = false,
					ttl = 0,
				},
				sections = {
					{ section = "startup" },
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		opts = {
			-- See Configuration section for options
			providers = {
				my_provider = {
					get_url = function(opts)
						return "http://localhost:1234/v1/chat"
					end,
					get_headers = function()
						local api_key = "lm_studio"
						return { ["Authorization"] = "Bearer " .. api_key }
					end,
					get_models = function()
						return { { id = "google/gemma-4-e2b", name = "Gemma 4 E2B" } }
					end,
					prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
					prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,
				},
			},
		},
	},
}
