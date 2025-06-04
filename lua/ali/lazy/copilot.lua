--[[
return {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
        vim.g.copilot_nes_debounce = 500
        vim.lsp.enable("copilot")
        vim.keymap.set("n", "<tab>", function()
            require("copilot-lsp.nes").apply_pending_nes()
        end)
    end,
}
--]]
return {
    -- {
    --     "github/copilot.vim",
    --     event = "InsertEnter",
    --     config = function()
    --         vim.g.copilot_filetypes = {
    --             ["*"] = false,
    --             ["javascript"] = true,
    --             ["typescript"] = true,
    --             ["typescriptreact"] = true,
    --             ["javascriptreact"] = true,
    --             ["html"] = true,
    --             ["css"] = true,
    --             ["scss"] = true,
    --             ["lua"] = true,
    --         }
    --         vim.g.copilot_no_tab_map = true
    --
    --         vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
    --             expr = true,
    --             replace_keycodes = false
    --         })
    --         vim.keymap.set('i', '<C-K>', 'copilot#Dismiss()', {
    --             expr = true,
    --             replace_keycodes = false
    --         })
    --         vim.keymap.set('i', '<C-]>', 'copilot#Next()', {
    --             expr = true,
    --             replace_keycodes = false
    --         })
    --     end
    -- },
}
-- {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--         require("copilot").setup({
--             suggestion = { enabled = false },
--             panel = { enabled = false },
--         })
--     end,
-- },
--
-- {
--     "zbirenbaum/copilot-cmp",
--     config = function()
--         require("copilot_cmp").setup()
--     end
-- } }
