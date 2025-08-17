-- lua/sdburt/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Define LSP servers, formatters, and linters to install
    local ensure_installed = {
      -- LSP
      "lua_ls",
      "pyright",
      "gopls",
      "sqlls",

      -- Formatters
      "stylua", -- lua
      "isort", "black", -- python
      "gofumpt", -- go
      "sqlfluff", -- sql

      -- Linters
      "selene", -- lua (using selene instead of luacheck)
      "pylint", -- python
      "golangci-lint", -- go
      "sqlfluff", -- sql (can also lint)
    }

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
        "sqlls",
      }
      -- automatic_installation = true, -- You might want this
    })

    mason_tool_installer.setup({
      ensure_installed = ensure_installed,
    })
  end,
} 