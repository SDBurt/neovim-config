-- lua/sdburt/plugins/alpha.lua
-- Greeter dashboard
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Header
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ____ ___  ____  ____  _____/ /_  ____ _____  ____ _]],
      [[ / __ `__ \/ __ \/ __ \/ ___/ __ \/ __ `/ __ \/ __ `/]],
      [[/ / / / / / /_/ / /_/ (__  ) / / / /_/ / / / / /_/ / ]],
      [[/_/ /_/ /_/\____/\____/____/_/ /_/\__,_/_/ /_/\__, /  ]],
      [[                                            /____/   ]],
    }
    dashboard.section.header.opts.hl = 'Type'

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button( "f", "  Find file", ":Telescope find_files <CR>"),
      dashboard.button( "r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button( "g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button( "c", "  Config", ":e $MYVIMRC | :cd %:p:h <CR>"), -- Assuming MYVIMRC points to ~/.config/nvim/init.lua or equivalent
      dashboard.button( "q", "  Quit Nvim", ":qa<CR>"),
    }
    dashboard.section.buttons.opts.hl = 'Keyword'

    -- Footer
    -- You can add a footer here if desired

    dashboard.config.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
} 