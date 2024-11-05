-- Lspconfig
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		-- Load lspconfig plugin
		local lspconfig = require("lspconfig")

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
		  	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		  	callback = function(ev)
		    	-- Enable completion triggered by <c-x><c-o>
		    	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		    	-- Buffer local mappings.
		    	-- See `:help vim.lsp.*` for documentation on any of the below functions
		    	local opts = { buffer = ev.buf }
		    	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		    	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		    	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		    	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		    	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		    	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		    	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		    	vim.keymap.set("n", "<leader>wl", function()
		    	  	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		    	end, opts)
		    	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		    	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		    	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		    	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		    	vim.keymap.set("n", "<leader>f", function()
		    	  	vim.lsp.buf.format { async = true }
		    	end, opts)
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Load mason-lspconfig
 		require("mason-lspconfig").setup({
			handlers = {
				-- Default setup for all language servers
				function(server_name)
					lspconfig[server_name].setup {
						capabilities = capabilities
					}
				end,

				-- Custom setup for lua_ls
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp = require("cmp")

		cmp.setup({
			mapping = {
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<Tab>"] = cmp.mapping.confirm { select = true },
			},

			sources = {
				{ name = "nvim_lsp" },
			},
		})
	end
}
