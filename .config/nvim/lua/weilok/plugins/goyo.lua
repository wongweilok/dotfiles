return {
	"junegunn/goyo.vim",

	keys = {
		{ "<leader>gy", ":Goyo | set linebreak<cr>", silent = true }
	},

	init = function()
		local goyo_group = vim.api.nvim_create_augroup("GoyoGroup", { clear = true })
		vim.api.nvim_create_autocmd("User", {
		    group = goyo_group,
		    pattern = "GoyoEnter",
		    callback = function()
		        require("lualine").hide()
		    end,
		})
		vim.api.nvim_create_autocmd("User", {
		    group = goyo_group,
		    pattern = "GoyoLeave",
		    callback = function()
		        require("lualine").hide({ unhide = true })
		    end,
		})
	end
}
