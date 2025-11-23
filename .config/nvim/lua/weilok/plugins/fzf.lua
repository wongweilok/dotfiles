return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        keymap = {
            builtin = {
                ["<C-u>"] = "preview-page-up",
                ["<C-d>"] = "preview-page-down",
                ["<C-w>"] = "toggle-preview-wrap",
            },

            fzf = {
                ["ctrl-u"] = "preview-page-up",
                ["ctrl-d"] = "preview-page-down",
                ["ctrl-w"] = "toggle-preview-wrap",
                ["ctrl-f"] = "half-page-down",
                ["ctrl-b"] = "half-page-up",
            },
        },

        fzf_opts = {
            ["--layout"] = "default",
        },
    },

    keys = {
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
        },
        {
            "<leader>bf",
            function()
                require("fzf-lua").buffers()
            end,
        },
        {
            "<leader>gr",
            function()
                require("fzf-lua").grep({
                    input_prompt = "Grep > "
                })
            end,
        },
        {
            "<leader>lg",
            function()
                require("fzf-lua").live_grep()
            end,
        },
        {
            "<leader>gs",
            function()
                require("fzf-lua").grep_cword()
            end,
        },
        {
            "<leader>of",
            function()
                require("fzf-lua").oldfiles()
            end,
        },
        {
            "<leader>gc",
            function()
                require("fzf-lua").git_commits()
            end,
        },
        {
            "<leader>gbc",
            function()
                require("fzf-lua").git_bcommits()
            end,
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").builtin()
            end,
        },
    },
}
