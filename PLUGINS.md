# Neovim Plugin Usage Guide

This document covers all the plugins installed in this Neovim configuration and how to use them effectively.

## 🎯 Harpoon - Quick File Navigation
**The most important productivity plugin**

### Keybindings:
```
<leader>a     - Add current file to harpoon list
<C-e>         - Toggle harpoon quick menu
<C-h/j/k/l>   - Jump to files 1/2/3/4
<C-S-P/N>     - Previous/next harpoon file
```

### Workflow:
1. Open your main project files
2. Press `<leader>a` in each file to add them to harpoon
3. Use `<C-h/j/k/l>` to instantly jump between your marked files
4. Use `<C-e>` to see/manage your harpoon list

This replaces traditional buffer/tab switching for your core files.

## ⚡ Flash - Enhanced Motion
**Better than default f/t motions**

### Keybindings:
```
s             - Flash jump (type 2 chars, then label)
S             - Flash treesitter (jump to code structures)
r             - Remote flash (in operator mode)
<c-s>         - Toggle flash in search
```

### How Flash Labels Work:
1. Press `s`
2. Type 2 characters (e.g., "th" to find "the", "this", "throw")
3. Flash highlights all matches with single-letter labels (a, b, c, etc.)
4. Press the label letter to jump to that location

**Example**: 
- Press `s`
- Type `fu` (to find "function")
- See labels: `a` at first "function", `b` at second "function"
- Press `a` to jump to first match

This is much faster than using `/` to search and then navigating matches.

## 🔧 Nvim-Surround - Text Objects
**Add/change/delete surrounding characters**

### Keybindings:
```
ys<motion><char>  - Add surround (ys2w" = surround 2 words with quotes)
yss<char>         - Surround entire line
cs<old><new>      - Change surround (cs"' = change " to ')
ds<char>          - Delete surround (ds" = remove quotes)
S<char>           - Surround selection (in visual mode)
```

### Examples:
- `ysiw"` - Surround current word with quotes: `word` → `"word"`
- `cs"'` - Change double quotes to single: `"hello"` → `'hello'`
- `ds(` - Delete parentheses: `(hello)` → `hello`
- `yss}` - Surround entire line with braces

## 🔗 Nvim-Autopairs
**Auto-close brackets/quotes**

Works automatically when typing:
- Type `(` → automatically adds `)`
- Type `"` → automatically adds closing `"`
- Integrates with completion for smart behavior

## 📊 Lualine - Status Line
**Shows current mode prominently**

### Features:
- **Mode indicator** with colors (INSERT/NORMAL/VISUAL/COMMAND)
- File information, git branch, file type
- Progress indicator and location in file
- No keybindings needed - just visual feedback

## 🚨 Trouble - Better Diagnostics

### Keybindings:
```
<leader>xx    - Workspace diagnostics (all project errors)
<leader>xd    - Document diagnostics (current file errors)
<leader>xq    - Quickfix list
<leader>xl    - Location list
gR            - LSP references (better than default)
```

### Usage:
Much better than default quickfix for viewing errors/warnings. Shows diagnostics in a clean, navigable list with context.

## 🔄 Refactoring Tools

### Keybindings:
```
<leader>re    - Extract function (visual mode)
<leader>rf    - Extract to file (visual mode)
<leader>rv    - Extract variable (visual mode)
<leader>ri    - Inline variable
<leader>rr    - Select refactor (shows menu)
<leader>rp    - Debug print
<leader>rc    - Cleanup debug prints
```

### Workflow:
1. Select code in visual mode
2. Press `<leader>re` to extract to function
3. Or use `<leader>rr` to see all available refactoring options

## 🖥️ ToggleTerm - Terminal Management

### Keybindings:
```
<C-\>         - Toggle floating terminal
<leader>gg    - LazyGit in terminal
<leader>tn    - Node REPL
<leader>tp    - Python REPL
<leader>tu    - htop
```

### In Terminal Mode:
```
<esc> or jk   - Exit terminal mode
<C-h/j/k/l>   - Navigate to other windows
```

### Usage:
- `<C-\>` for quick commands in floating terminal
- `<leader>gg` for git operations with LazyGit
- Language REPLs for quick testing

## 🐛 DAP - Debugging

### Keybindings:
```
<space>b      - Toggle breakpoint
<space>gb     - Run to cursor
<F1>          - Continue/Start debugging
<F2>          - Step into
<F3>          - Step over
<F4>          - Step out
<F5>          - Step back
<F13>         - Restart
<leader>da    - Debug with launch.json
<leader>dd    - Toggle debug UI
<leader>dc    - Clear all breakpoints
<leader>dl    - List breakpoints
```

### Workflow:
1. Set breakpoints with `<space>b`
2. Start debugging with `<F1>` or `<leader>da`
3. Use F-keys to step through code
4. Debug UI opens automatically

## 📝 Comment.nvim
**Smart commenting with treesitter support**

### Keybindings:
```
gcc           - Toggle line comment
gc<motion>    - Comment motion (gc2j = comment 2 lines down)
gbc           - Toggle block comment
gb<motion>    - Block comment motion
```

### Visual Mode:
```
gc            - Comment selection
gb            - Block comment selection
```

### Examples:
- `gcc` - Toggle comment on current line
- `gc2j` - Comment current line and 2 lines below
- Select text, then `gc` - Comment selection

## 🔍 Which-Key - Keybinding Discovery

### Usage:
- Start typing any key sequence (like `<leader>`)
- Wait 300ms - a popup shows available completions
- No memorization needed - it teaches you as you go

### Key Groups:
- `<leader>f` - File/find operations
- `<leader>g` - Git operations  
- `<leader>x` - Diagnostics/quickfix
- `<leader>r` - Refactoring
- `<leader>t` - Terminal/toggles

## 🎯 Mini.ai - Better Text Objects
**Enhanced text objects for more precise editing**

### Text Objects:
```
af/if         - Function outer/inner
ac/ic         - Class outer/inner  
ao/io         - Block/conditional/loop outer/inner
ad/id         - Number sequences
ae/ie         - Word sequences  
ag/ig         - Entire buffer
at/it         - HTML/XML tags
```

### Examples:
- `daf` - Delete entire function
- `cic` - Change inside class
- `vio` - Select inside block/loop
- `yae` - Yank word sequence

## 🌳 Undotree - Visual Undo History

### Keybindings:
```
<leader>u     - Toggle undo tree visualization
```

### Usage:
- Shows complete undo history as a tree
- Navigate with j/k, press Enter to restore state
- Never lose work - see every change you've made

## 📁 File Navigation - Oil vs Nvim-Tree

### Oil.nvim (Directory Editing):
```
-             - Open parent directory in current buffer
<leader>-     - Open parent directory in floating window
```
- Edit directories like files
- Make changes (rename, delete, move) then save with `:w`
- Best for: Quick operations, bulk file management

### Nvim-Tree (Traditional Sidebar):
```
<leader>e     - Toggle file explorer sidebar
```
- Persistent sidebar view with tree structure
- Git integration shows file status
- Best for: Project overview, visual navigation

## 🎨 Catppuccin Theme
**Beautiful theme with proper integrations**

- Mocha flavor (dark) with transparent background
- Integrated with all plugins for consistent styling
- Set as default colorscheme

## 🔧 Additional Quality of Life

### Vim-Sleuth
- Automatically detects indentation (tabs vs spaces, width)
- No configuration needed - works silently

### Vim-Repeat  
- Makes plugin commands repeatable with `.`
- Works with surround, comment, and other plugins

### Indent Blankline
- Shows visual indentation guides
- Helps with code structure in Python, YAML, etc.

## 💡 Pro Tips & Workflows

### Essential Daily Workflow:
1. **Start with Harpoon** - Add your main files (`<leader>a`), jump with `<C-h/j/k/l>`
2. **Use Flash for navigation** - `s` + 2 chars + label (faster than searching)
3. **Trouble for diagnostics** - `<leader>xx` to see all project errors
4. **Which-key for discovery** - Press `<leader>` and explore

### File Management:
- **Quick edits**: Use Oil (`-`) to edit directories like buffers
- **Project overview**: Use nvim-tree (`<leader>e`) for visual navigation
- **Terminal operations**: `<C-\>` for quick commands, `<leader>gg` for git

### Code Editing:
- **Surround operations**: Learn `ys`, `cs`, `ds` for quick text manipulation
- **Smart commenting**: `gcc` for lines, `gc` in visual mode
- **Better text objects**: `daf` (delete function), `cic` (change class)

### Debugging:
- Set breakpoints (`<space>b`), start with `<F1>`
- Use `<leader>dd` to toggle debug UI
- Step through with F2/F3/F4

### Most Important to Learn First:
1. **Harpoon** - Transform file navigation
2. **Flash** - Better movement
3. **Surround** - Text manipulation
4. **Which-key** - Discover features
5. **Trouble** - Better error handling

This configuration transforms Neovim into a modern, efficient development environment. Start with the essential workflow and gradually explore more features as needed.