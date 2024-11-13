-- Mason for managing LSP servers
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim"
	},

	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
            		package_pending = "➜",
            		package_uninstalled = "✗"
				},

				border = "single",
				height = 0.8,
			}
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})
	end
}
