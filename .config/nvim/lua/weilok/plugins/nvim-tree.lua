return {
	"nvim-tree/nvim-tree.lua",

	opts = {
		view = {
			width = 30,
			relativenumber = true,
		},

		git = { ignore = false },
	},

	config = function(_, opts)
		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup(opts)

		-- Nvim-tree keymaps
		local keymap = vim.keymap
		local api = require("nvim-tree.api")

		keymap.set("n", "<leader>fe", api.tree.toggle)
	end
}