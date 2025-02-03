local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippet expansion
		end,
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(), -- Open completion menu
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
		["<Tab>"] = cmp.mapping.select_next_item(), -- Select next item
		["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Select previous item
	},
	sources = {
		{ name = "nvim_lsp" }, -- LSP completions
		{ name = "luasnip" }, -- Snippet completions
		{ name = "buffer" }, -- Buffer completions
		{ name = "path" }, -- File path completions
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- Show both icons and text
			maxwidth = 50, -- Prevent the popup from being too wide
			ellipsis_char = "...", -- Show ellipsis when text overflows
			before = function(entry, vim_item)
				-- Add a label to indicate the source of the completion
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	window = {
		completion = cmp.config.window.bordered(), -- Add borders to completion window
		documentation = cmp.config.window.bordered(), -- Add borders to documentation window
	},
})
