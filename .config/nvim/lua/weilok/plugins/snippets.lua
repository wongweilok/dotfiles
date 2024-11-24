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
		local keymap = vim.keymap

		luasnip.filetype_extend("php", { "html" })
		luasnip.filetype_extend("blade", { "html" })

		keymap.set({"i", "s"}, "<C-w>", function() luasnip.jump( 1) end, {silent = true})
		keymap.set({"i", "s"}, "<C-b>", function() luasnip.jump(-1) end, {silent = true})

		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

