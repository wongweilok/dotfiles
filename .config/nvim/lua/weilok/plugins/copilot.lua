return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = false,
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
    },
}
