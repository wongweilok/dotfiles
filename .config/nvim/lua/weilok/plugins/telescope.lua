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

	keys = { 	-- Telescope keymaps
		{
			"<leader>tff",
			function()
				require("telescope.builtin").find_files()
			end
		},
		{
			"<leader>tof",
			function()
				require("telescope.builtin").oldfiles()
			end
		},
		{
			"<leader>tlg",
			function()
				require("telescope.builtin").live_grep()
			end
		},
		{
			"<leader>tbf",
			function()
				require("telescope.builtin").buffers()
			end
		},
		{
			"<leader>tgs",
			function()
				require("telescope.builtin").grep_string()
			end
		},
		{
			"<leader>tgr",
			function()
				require("telescope.builtin").grep_string({
                    search = vim.fn.input("Grep > ")
                })
			end
		},
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

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
	end
}
