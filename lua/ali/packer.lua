-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- telescope - fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- treesitter - syntax highlighter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- rose-pine - color theme
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	-- harpoon 
	use("ThePrimeagen/harpoon")

	-- mason - lsp manager
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- cmp - auto completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim"
		},
	})

	-- null-ls - linter and formatter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
	})


	-- vim-be-good - a gome for vim
	use({ "ThePrimeagen/vim-be-good" })

end)
