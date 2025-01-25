require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls", -- Go
		"ts_ls", -- TypeScript
		"tailwindcss", -- Tailwind CSS
		"lua_ls", -- Lua
	},
})
