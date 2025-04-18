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
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"gofumpt",
				"goimports",
				"prettierd",

				"eslint",
				"golangci-lint",
			},
		})

		local null_ls = require("null-ls")
		local sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.prettierd.with({
				filetypes = {
					"gohtml",
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

			null_ls.builtins.diagnostics.golangci_lint,
		}

		local function eslint_config_exists()
			local eslint_files = {
				".eslintrc.js",
				".eslintrc.cjs",
				".eslintrc.json",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc",
				"eslint.config.js",
			}

			local current_dir = vim.fn.getcwd()
			for _, file in ipairs(eslint_files) do
				if vim.fn.filereadable(current_dir .. "/" .. file) == 1 then
					return true
				end
			end

			return false
		end

		if eslint_config_exists() then
			table.insert(sources, require("none-ls.diagnostics.eslint"))
		end

		null_ls.setup({
			sources = sources,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({
					async = false,
					timeout_ms = 10000,
				})
			end,
		})
	end,
}
