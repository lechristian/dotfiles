return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- A list of formatters to use.
		formatters_by_ft = {
			lua = { "stylua" },
			-- Use a sub-table to specify arguments both for cli and lsp
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
		},
		-- Set up format-on-save
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
