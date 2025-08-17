-- init.lua
-- Summary: Serves as the primary configuration script for NeoVim, orchestrating the loading of plugins, key mappings, settings, and more.
-- This file integrates various configurations to customize and optimize the NeoVim environment according to user preferences.

-- Load Packer plugins
-- require('packer').startup(function(use)
--     use 'wbthomason/packer.nvim' -- Plugin manager
--     -- Additional plugins here
-- end)

-- Set custom key mappings
-- vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Maps '<leader>e' to toggle the NvimTree explorer in normal mode.

-- Apply editor settings
-- require('set')

-- Note: This file acts as the entry point for all custom NeoVim configurations.


require('sdburt.core') -- Load core options and keymaps
-- require('sdburt.set') -- Old require, removed
-- require('sdburt.remap') -- Old require, removed
require("sdburt.lazy_init")


local augroup = vim.api.nvim_create_augroup
local TheSDBurtGroup = augroup('TheSDBurt', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


function R(name)
    require("plenary.reload").reload_module(name)
end



autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheSDBurtGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = TheSDBurtGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
