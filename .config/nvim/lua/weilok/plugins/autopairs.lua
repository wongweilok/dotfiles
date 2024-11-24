return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
        ts_config = {
            lua = { "string" },
            javascript = { "template_string" },
            java = false,
        },
    },

    config = function(_, opts)
        require("nvim-autopairs").setup(opts)
    end
}