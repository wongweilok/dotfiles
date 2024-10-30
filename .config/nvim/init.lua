vim.g.mapleader = ","

require("weilok.config")
require("weilok.lazy")

-- Load theme
vim.cmd.colorscheme("gruvbox")
vim.cmd.highlight({"Normal", "guibg=NONE"})
vim.cmd.highlight({"Normal", "ctermbg=NONE"})
