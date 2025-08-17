-- remap.lua
-- Summary: Customizes key mappings in NeoVim, enhancing usability and efficiency by redefining keys for common actions and plugin functionalities.
-- This script defines global and mode-specific keybindings to streamline workflows and interactions within the editor.

-- Example keymap to save a file
-- vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- This keymap sets '<leader>w' to save the current file in normal mode.

-- Example keymap for opening Telescope
-- vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- This keymap sets '<leader>ff' to open the Telescope file finder in normal mode.

-- Note: '<leader>' is a placeholder key, often set to '\' or ',' by default. Customize it in your NeoVim settings.


-- Set the leader key globally to a space (' ') for easier access to leader keybindings.
vim.g.mapleader = " "

local keymap = vim.keymap

-- Open the project's root directory in the sidebar. Requires NERDTree or a similar directory navigation plugin.
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, move selected lines down with 'J'. Useful for quickly reordering lines.
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- In visual mode, move selected lines up with 'K'. Complements the above command for line reordering.
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without moving the cursor using 'J' in normal mode, maintaining the cursor's position.
keymap.set("n", "J", "mzJ`z")
-- Scroll down half a page and center the view on the new cursor position with Ctrl+d.
keymap.set("n", "<C-d>", "<C-d>zz")
-- Scroll up half a page and center the view on the new cursor position with Ctrl+u.
keymap.set("n", "<C-u>", "<C-u>zz")
-- Move to the next search result and center the view with 'n', improving readability.
keymap.set("n", "n", "nzzzv")
-- Move to the previous search result and center the view with 'N', for consistent navigation experience.
keymap.set("n", "N", "Nzzzv")

-- Paste over a selection in visual mode without overwriting the clipboard, preserving the original yanked text.
keymap.set("x", "<leader>p", [["_dP]])

-- Quickly save the current file with Ctrl+s in normal mode, streamlining the save operation.
keymap.set("n", "<C-s>", ":w<CR>")

-- Close the current buffer with Ctrl+w in normal mode, allowing for quick buffer management.
keymap.set("n", "<C-w>", ":bd<CR>")

-- Split window vertically with <leader>sv, and navigate between splits using Ctrl+h/j/k/l, enhancing window management.
keymap.set("n", "<leader>sv", ":vsp<CR>")
keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")

-- Open a new tab with Ctrl+t, and navigate between tabs using Tab and Shift+Tab, simplifying tab navigation.
keymap.set("n", "<C-t>", ":tabnew<CR>")
keymap.set("n", "<Tab>", ":tabnext<CR>")
keymap.set("n", "<S-Tab>", ":tabprev<CR>")

-- Adjust window sizes with Ctrl+Arrow keys, providing intuitive control over the window layout.
keymap.set("n", "<C-Up>", ":resize +2<CR>")
keymap.set("n", "<C-Down>", ":resize -2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Enhance command line navigation with Ctrl+a/e/p/n, mirroring shell keyboard shortcuts for efficiency.
keymap.set("c", "<C-a>", "<Home>")
keymap.set("c", "<C-e>", "<End>")
keymap.set("c", "<C-p>", "<Up>")
keymap.set("c", "<C-n>", "<Down>")

-- Navigate the quick fix list with <leader>qn and <leader>qp, and open/close it with <leader>qo and <leader>qc, facilitating error handling.
keymap.set("n", "<leader>qn", ":cnext<CR>")
keymap.set("n", "<leader>qp", ":cprev<CR>")
keymap.set("n", "<leader>qo", ":copen<CR>")
keymap.set("n", "<leader>qc", ":cclose<CR>")

-- Search and replace the current word under the cursor in the whole file with <leader>sr, streamlining find-and-replace operations.
keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>")

-- Keymaps from Josean's blog post (adapted/added)

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management (additions/alternatives)
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management (additions/alternatives)
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

