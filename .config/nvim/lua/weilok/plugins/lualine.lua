-- Statusline by Lualine
local function spell()
	if vim.wo.spell == true then
		return 'SPELL [' .. string.upper(vim.bo.spelllang) .. ']'
	end
	return ''
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

	opts = {
		options = { theme = "gruvbox-material" },

		sections = {
			lualine_x = { spell, 'encoding', 'fileformat', 'filetype' },
		},
	},
}
