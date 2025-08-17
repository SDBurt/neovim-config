-- lua/sdburt/plugins/conform.lua
-- Formatter configuration
return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" }, -- Format on save
  cmd = { "ConformInfo" },
  opts = {
    -- Map filetypes to formatters installed by Mason
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      go = { "gofumpt" }, -- Using gofumpt instead of gofmt/goimports
      sql = { "sqlfluff" },
      -- Add other filetypes if needed
      ["_"] = { "trim_whitespace" }, -- fallback for other types
    },
    -- Configure format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Use LSP formatter if conform formatter fails
    },
  },
  init = function()
    -- Optional: Add a keymap to format manually
    vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>FormatWrite<CR>",
                             { noremap = true, silent = true, desc = "Format current buffer" })
  end,
} 