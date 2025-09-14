-- Mason for managing LSP servers
return {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },

            border = "single",
            height = 0.8,
        }
    }
}
