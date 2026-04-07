
-- enable the new message ui
require('vim._core.ui2').enable()

-------------------------------------------------------------------------------
---                                                                         ---
---                                  SETTINGS                               ---
---                                                                         ---
-------------------------------------------------------------------------------
--- tabs
vim.expandtab = true

--- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- junk files
vim.opt.undofile = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- behaviour
vim.opt.exrc = true
vim.opt.mouse = 'a'

-------------------------------------------------------------------------------
---                                                                         ---
---                                   KEYMAPS                               ---
---                                                                         ---
-------------------------------------------------------------------------------
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- NORMAL MODE
vim.keymap.set("n", "U", ":redo<CR>", {})
vim.keymap.set("n", "<TAB>", "==", {})
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", {})
vim.keymap.set("n", "<S-l>", ":bnext<CR>", {})

-- INSERT MODE
vim.keymap.set("i", "jj", "<Esc>", {})

-- VISUAL
vim.keymap.set("x", "<TAB>", "=", {})

-- TERMINAL
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
