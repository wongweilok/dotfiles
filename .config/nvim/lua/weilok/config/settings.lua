local opt = vim.opt
local g = vim.g

-- Basic settings
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.hlsearch = false
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.winborder = "rounded"

-- C header file
g.c_syntax_for_h = 1
