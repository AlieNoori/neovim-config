return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	event = { "BufWritePre" },
	config = function()
		-- Ensure Mason tools are installed
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"stylua",
				"gofumpt",
				"goimports",
				"prettierd",

				-- Linters
				"eslint",
				"golangci-lint",
			},
		})

		-- Null-ls setup
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- formatting
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.gofumpt, -- go
				null_ls.builtins.formatting.goimports, -- Go
				null_ls.builtins.formatting.prettierd.with({ -- Web
					filetypes = {
						"html",
						"css",
						"json",
						"mjs",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
					},
				}),

				-- Linting
				null_ls.builtins.diagnostics.golangci_lint, -- Go
				require("none-ls.diagnostics.eslint"),
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})

		-- Manual formatting keymap
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
	end,
}
