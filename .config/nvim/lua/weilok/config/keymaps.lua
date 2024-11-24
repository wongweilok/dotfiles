vim.g.mapleader = " "

-- General keymaps
local keymap = vim.keymap

keymap.set("n", "c", '"_c')
keymap.set("n", "<leader>sc", ":setlocal spell! spelllang=en_gb<CR>")
keymap.set("n", "S", ":%s//g<Left><Left>")
keymap.set({ "n", "v" }, "<leader>j", '<Esc>/<++><CR>"_c4l')

