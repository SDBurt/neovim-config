-- lua/sdburt/plugins/tmux.lua
-- For seamless navigation between nvim splits and tmux panes
return {
  "christoomey/vim-tmux-navigator",
  lazy = false, -- Load immediately
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  -- No specific Neovim keymaps needed here if you configure Tmux correctly.
  -- vim-tmux-navigator relies on mappings in your .tmux.conf
  -- See plugin documentation for required Tmux configuration.
} 