return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({})
			end,
		}
	},

	opts = {
		formatters_by_ft = {
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			php = { "pint" },
		},

		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
