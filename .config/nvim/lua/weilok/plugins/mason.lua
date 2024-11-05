-- Mason for managing LSP servers
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim"
	},

	config = function()
		require("mason").setup({
			ui = {
				icon = {
					package_installed = "✓",
            		package_pending = "➜",
            		package_uninstalled = "✗"
				}
			}
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})
	end
}
