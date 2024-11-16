return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",

	event = "InsertEnter",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local luasnip = require("luasnip")
		luasnip.filetype_extend("php", { "html" })

		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

