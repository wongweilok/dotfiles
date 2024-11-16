-- Lspconfig
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		-- Load lspconfig
		local lspconfig = require("lspconfig")
		local keymap = vim.keymap

		-- Set keymaps after language server attached to buffer
		vim.api.nvim_create_autocmd("LspAttach", {
		  	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		  	callback = function(ev)
		    	vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		    	local opts = { buffer = ev.buf }
		    	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		    	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		    	keymap.set("n", "K", vim.lsp.buf.hover, opts)
		    	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		    	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		    	keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		    	keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		    	keymap.set("n", "<leader>wl", function()
		    	  	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		    	end, opts)
		    	keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		    	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		    	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		    	keymap.set("n", "gr", vim.lsp.buf.references, opts)
		    	keymap.set("n", "<leader>fm", function()
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
			snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<Tab>"] = cmp.mapping.confirm { select = true },
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}),
		})
	end
}
