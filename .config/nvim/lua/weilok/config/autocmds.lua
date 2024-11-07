-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap

-- Compile and run code
local code_compilergp = augroup("CodeCompiler", { clear = true })

autocmd("FileType", {
	pattern = "c",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", ":terminal gcc % -lm -o %< && ./%< <CR>")
	end
})

autocmd("FileType", {
	pattern = "c++",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", ":terminal g++ % -lm -o %< && ./%< <CR>")
	end
})

autocmd("FileType", {
	pattern = "python",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", ":terminal python % <CR>")
	end
})

autocmd("FileType", {
	pattern = "go",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", ":terminal go run % <CR>")
	end
})

autocmd("FileType", {
	pattern = "rust",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", ":terminal cargo run <CR>")
	end
})

autocmd("FileType", {
	pattern = "r",
	group = code_compilergp,
	callback = function()
		keymap.set("n", "<leader>c", "terminal Rscript % <CR>")
	end
})

-- Document typesetting
local doc_group = augroup("DocTypesetting", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ms", "*.me", "*.mom", "*.man" },
	group = doc_group,
	command = "set filetype=groff",
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.tex",
	group = doc_group,
	command = "set filetype=tex",
})

autocmd("FileType", {
	pattern = "groff",
	group = doc_group,
	callback = function()
		keymap.set("n", "<leader>c", ":!groff -ms % -rHY=0 -T pdf > %<.pdf <CR>")
	end
})

autocmd("FileType", {
	pattern = "tex",
	group = doc_group,
	callback = function()
		keymap.set("n", "<leader>c", "!pdflatex % <CR>")
	end
})
