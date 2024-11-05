return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Gitsigns keymaps
			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({"]h", bang = true})
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({"[h", bang = true})
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			map("v", "<leader>hs", function()
				gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")}
			end)

    		map("v", "<leader>hr", function()
				gitsigns.reset_hunk {vim.fn.line("."), vim.fn.line("v")}
			end)

			map("n", "<leader>hb", function()
				gitsigns.blame_line{ full = true }
			end)

			map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("n", "<leader>hu", gitsigns.undo_stage_hunk)
			map("n", "<leader>hp", gitsigns.preview_hunk)
			map("n", "<leader>td", gitsigns.toggle_deleted)
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			map("n", "<leader>hd", gitsigns.diffthis)
		end
	},
}
