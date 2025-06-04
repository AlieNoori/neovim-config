return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" },
                go = { "gofumpt", "goimports", lsp_format = "fallback" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescriptreact = { "prettierd" },
                css = { "prettierd" },
                html = { "prettierd" },
                json = { "prettierd" },
            },
            format_on_save = {
                timeout_ms = 10000,
            },
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
    priority = 20
}
