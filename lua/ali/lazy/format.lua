-- Create this file as: lua/ali/lazy/format.lua

return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Optional key binding to manually format
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = false })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define formatters for different file types
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt", "goimports" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			-- Add more formatters for other file types as needed
		},
		-- Set up format-on-save
		format_on_save = {
			-- Customize format on save behavior
			timeout_ms = 5000,
			lsp_fallback = false, -- Disable LSP fallback
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- Disable formatting capabilities for all LSP servers
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
			end,
		})
	end,
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
