-- Essential parsers
-- lua, html, css, php, php_only, javascript, blade, markdown, markdown_inline

return {
    "nvim-treesitter/nvim-treesitter",
    branch  = "main",
    lazy = false,
    build = ":TSUpdate",

    dependencies = {
        "windwp/nvim-ts-autotag",
    },

    config = function(_, opts)
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
            }
        })

        -- Keybind to list out installed parsers
        local keymap = vim.keymap
        keymap.set("n", "<leader>tsp", function()
            vim.print(require("nvim-treesitter").get_installed())
        end, { silent = true })
    end
}
