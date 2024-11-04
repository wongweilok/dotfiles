return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	dependencies = {
		"windwp/nvim-ts-autotag",
	},

	opts = {
		ensure_installed = {
			"lua",
			"html",
			"css",
			"php",
			"javascript",
		},

		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
			}
		})
	end
}
