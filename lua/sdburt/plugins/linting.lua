-- lua/sdburt/plugins/linting.lua
-- Linting configuration
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile", "InsertLeave" }, -- Lint on events
  config = function()
    local lint = require("lint")

    -- Map filetypes to linters installed by Mason
    lint.linters_by_ft = {
      lua = { "selene" },
      python = { "pylint" },
      go = { "golangci-lint" },
      sql = { "sqlfluff" },
      -- Add other filetypes if needed
    }

    -- Configure linting to run automatically
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        -- Use a timer to debounce linting
        vim.defer_fn(function()
           lint.try_lint()
        end, 100) -- Delay in ms
      end,
    })

    -- Optional: Add a keymap to trigger linting manually
    vim.keymap.set("n", "<leader>li", function()
      lint.try_lint()
    end, { desc = "Trigger linting" })
  end,
} 