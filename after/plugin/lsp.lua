local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Shared on_attach function to disable formatting for all LSP servers
local on_attach = function(client, bufnr)
	-- Disable formatting for all LSP servers
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	-- Keybindings
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Remap "Go to Definition" to gd
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end

-- Go
lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach, -- Disable formatting for gopls
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

-- TypeScript
lspconfig.ts_ls.setup({
	on_attach = on_attach, -- Disable formatting for tsserver
})

-- Tailwind CSS
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach, -- Disable formatting for tailwindcss
})

-- Lua
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach, -- Disable formatting for lua_ls
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- CSS
lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- HTML
lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
