local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Prettier for JavaScript, TypeScript, JSON, CSS, HTML, YAML
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"json",
				"css",
				"html",
				"yaml",
			},
		}),

		-- gofmt for Go files
		null_ls.builtins.formatting.gofmt.with({
			filetypes = { "go" }, -- Only apply to Go files
		}),

		-- gofumpt for Go files (stricter formatting)
		null_ls.builtins.formatting.gofumpt.with({
			filetypes = { "go" }, -- Only apply to Go files
		}),

		-- stylua for Lua files
		null_ls.builtins.formatting.stylua.with({
			filetypes = { "lua" }, -- Only apply to Lua files
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false, timeout_ms = 5000 }) -- Increase timeout to 5 seconds
				end,
			})
		end
	end,
})
