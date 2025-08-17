-- lazy_init.lua
-- Summary: Configures lazy loading for NeoVim plugins and settings, aiming to improve editor startup time and performance.
-- This script employs deferred loading strategies for plugins and settings that are not immediately necessary on startup,
-- ensuring a faster and more efficient initialization process.

-- Example of lazy loading a plugin with conditions
-- use {
--     'nvim-treesitter/nvim-treesitter',
--     run = ':TSUpdate',
--     event = 'BufRead' -- Lazy loads the plugin on buffer read event
-- }

-- Example of deferring a configuration script
-- vim.defer_fn(function()
--     require('nvim-lspconfig').setup{}
-- end, 1000) -- Defers LSP configuration by 1000 milliseconds after startup

-- Note: Lazy loading requires specific plugin management tools like Packer that support this functionality.


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "sdburt.plugins",
    change_detection = { notify = false }
})
