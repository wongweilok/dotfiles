return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make"
		},
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},

			pickers = {
				find_files = {
					find_command = {
						"rg", "--files", "--hidden", "--glob", "!**/.git/*"
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- Telescope keybindings
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", builtin.find_files)
		keymap.set("n", "<leader>of", builtin.oldfiles)
		keymap.set("n", "<leader>lg", builtin.live_grep)
		keymap.set("n", "<leader>gs", builtin.grep_string)
	end
}
