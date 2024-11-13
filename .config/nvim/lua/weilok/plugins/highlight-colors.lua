return {
	"brenoprata10/nvim-highlight-colors",
	keys = {
		{ "<leader>ho", ":HighlightColors On<CR>", silent = true }
	},

	opts = {
		enable_tailwind = true,
	},

	config = function(_, opts)
		local hl_colors = require("nvim-highlight-colors")

		hl_colors.setup(opts)

		vim.keymap.set("n", "<leader>th", hl_colors.toggle)
	end
}
