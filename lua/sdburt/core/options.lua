-- set.lua
-- Summary: Configures NeoVim settings and options, adjusting the editor's behavior and appearance to suit user preferences.
-- This script sets global options like tab sizes, line numbers, and theme configurations, among others, to enhance the editing experience.

-- Example setting for line numbers
-- vim.opt.number = true
-- Enables line numbers in the editor.

-- Example setting for tab size
-- vim.opt.tabstop = 4
-- Sets the number of spaces that a tab in the file counts for.

-- Note: These settings are applied globally and affect all files and sessions in NeoVim.

vim.cmd("let g:netrw_liststyle = 3") -- Use list style for netrw

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- User specific additions/preferences (kept from original)
opt.backup = false -- Keep user preference
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Keep user preference
opt.undofile = true -- Keep user preference
opt.hlsearch = false -- Keep user preference
opt.incsearch = true -- Keep user preference
opt.scrolloff = 8 -- Keep user preference
opt.isfname:append("@-@") -- Keep user preference
opt.updatetime = 50 -- Keep user preference
opt.colorcolumn = "80" -- Keep user preference
