-- Custom section: Display spell check status
local function spell()
	if vim.wo.spell == true then
		return 'SPELL [' .. string.upper(vim.bo.spelllang) .. ']'
	end
	return ''
end

-- Custom section: Display Copilot autosuggestion status
CopilotSuggestionEnabled = false
local function copilot_suggestion_status()
    if CopilotSuggestionEnabled then
        return ' '
    end
    return ' '
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

	opts = {
		options = { theme = "gruvbox-material" },

		sections = {
			lualine_x = { copilot_suggestion_status, spell, 'encoding', 'fileformat', 'filetype' },
		},
	},
}
