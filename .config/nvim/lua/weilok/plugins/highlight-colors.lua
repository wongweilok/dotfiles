return {
	"brenoprata10/nvim-highlight-colors",

	opts = {
		enable_tailwind = true,
	},

	keys = {
		{ "<leader>ho", ":HighlightColors On<CR>", silent = true },
		{ "<leader>ht", ":HighlightColors Toggle<CR>", silent = true }
	},
}
