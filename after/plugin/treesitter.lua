require("nvim-treesitter.configs").setup({
	ensure_installed = { "go", "typescript", "javascript", "tsx", "html", "css", "lua" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
