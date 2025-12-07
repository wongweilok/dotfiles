return {
    "stevearc/conform.nvim",
    cmd = { "ConformInfo" },

    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({ async = true }, function(err)
                    if not err then
                        local mode = vim.api.nvim_get_mode().mode
                        if vim.startswith(string.lower(mode), "v") then
                            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
                        end
                    end
                end)
            end,
            mode = { "n", "v" },
        }
    },

    opts = {
        formatters_by_ft = {
            html = { "prettier" },
            css = { "prettier" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            php = { "pint" },
            blade = { "blade-formatter" },
        },

        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
