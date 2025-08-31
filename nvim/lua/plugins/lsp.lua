return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		-- Get the capabilities from cmp_nvim_lsp
		-- This is required for autocompletion to work
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Tell mason-lspconfig how to setup servers
		require("mason-lspconfig").setup_handlers({
			-- The default handler for most servers
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- Special setup for lua_ls to get Neovim types
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
							diagnostics = { globals = { "vim" } },
						},
					},
				})
			end,
		})

		-- Ensure mason is setup before everything else
		require("mason").setup()
	end,
}
