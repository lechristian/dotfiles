return {
	{ "folke/lazy.nvim" },
	{
		"folke/tokyonight.nvim",
		enabled = false,
	},
	{
		"folke/flash.nvim",
		enabled = false,
		keys = false,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "onedark",
			defaults = {
				keymaps = false,
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 5000,
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = false },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
