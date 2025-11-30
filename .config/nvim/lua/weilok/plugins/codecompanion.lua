return {
    "olimorris/codecompanion.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        ignore_warnings = true,

        strategies = {
            chat = {
                adapter = {
                    name = "copilot",
                    model = "claude-sonnet-4.5",
                },
            },
        },
    },

    keys = {
        { "<leader>acc", ":CodeCompanionChat<CR>",        mode = "n", silent = true },
        { "<leader>act", ":CodeCompanionChat Toggle<CR>", mode = "n", silent = true },
        { "<leader>aca", ":CodeCompanionChatActions<CR>", mode = "n", silent = true },
        { "<leader>aca", ":CodeCompanionChat Add<CR>",    mode = "v", silent = true },
    },
}
