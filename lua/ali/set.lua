-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	float = { border = "rounded" },
	update_in_insert = false,
})

vim.diagnostic.config({virtual_lines=true})
