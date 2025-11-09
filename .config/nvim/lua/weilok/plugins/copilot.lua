return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
            },
            panel = { enabled = false },
            telemetry = { telemetryLevel = "off" }
        },
        keys = {
            {
                "<leader>ast",
                function()
                    CopilotSuggestionEnabled = not CopilotSuggestionEnabled
                    require("copilot.suggestion").toggle_auto_trigger()
                end,
                mode = "n",
            }
        }
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        cmd = "CopilotChat",
        event = "InsertEnter",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        opts = {
            window = {
                layout = 'vertical',
                width = 0.3,
            },
        },
        keys = {
            { "<leader>acc", ":CopilotChat<CR>",         mode = "n" },
            { "<leader>act", ":CopilotChatToggle<CR>",   mode = "n" },
            { "<leader>acs", ":CopilotChatStop<CR>",     mode = "n" },
            { "<leader>acm", ":CopilotChatModels<CR>",   mode = "n" },
            { "<leader>ace", ":CopilotChatExplain<CR>",  mode = "v" },
            { "<leader>acr", ":CopilotChatReview<CR>",   mode = "v" },
            { "<leader>acf", ":CopilotChatFix<CR>",      mode = "v" },
            { "<leader>aco", ":CopilotChatOptimize<CR>", mode = "v" },
        },
        config = function(_, opts)
            local chat = require("CopilotChat")

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "copilot-chat",
                callback = function()
                    vim.opt_local.relativenumber = false
                    vim.opt_local.number = false
                end,
            })

            chat.setup(opts)
        end
    }
}
