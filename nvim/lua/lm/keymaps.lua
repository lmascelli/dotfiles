local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--------------------------------------  NORMAL --------------------------------

--  Window moving
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap('n', '<leader>wc', '<cmd>q<cr>', opts)
keymap('n', '<leader>wo', '<cmd>only<cr>', opts)
keymap('n', '<leader>qq', '<cmd>qa!<cr>', opts)
keymap('n', '<m-ScrollWheelUp>', 'zhzh', opts)
keymap('n', '<m-ScrollWheelDown>', 'zlzl', opts)

--  File explorer
keymap("n", "<leader>e", ":lua vim.g.lm.toggle_explorer()<cr>", opts)

--  Window resizing
keymap("n", "<C-+>", ":lua vim.g.lm.increase_font_size()<cr>", opts)
keymap("n", "<C-->", ":lua vim.g.lm.decrease_font_size()<cr>", opts)

keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Buffer editing
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("n", "U", ":redo<cr>", opts)

-- Script evaluating
keymap('n', '<leader>vc', '<cmd>source %<cr>', {})
keymap('n', '<leader>vr', '<cmd>lua vim.g.lm.reload_vimrc()<cr>', {
  silent = true,
  nowait = true,
})
keymap('n', '<leader>vl', '<cmd>lua vim.g.lm.project_lua()<cr>', {
  silent = true,
  nowait = true,
})
keymap('n', '<leader>vp', '<cmd>lua vim.g.lm.project_ps1()<cr>', {
  silent = true,
  nowait = true,
})

------------------------------------- INSERT ----------------------------------

keymap("i", "<C-ì>", "<C-k>'?", opts)
keymap("c", "<C-ì>", "<C-k>'?", opts)
keymap("i", "<C-'>", "<C-k>'!", opts)
keymap("c", "<C-'>", "<C-k>'!", opts)
keymap("i", "<s-cr>", "<c-o>O", opts)
keymap("i", "<c-cr>", "<c-o>o", opts)

-- Completion
keymap("i", "<C-Space>", "<C-x><C-o>", opts)

-- File saving
keymap("i", "<C-s>", "<cmd>:w<cr>", opts)


------------------------------------- VISUAL ----------------------------------

-- Moving text
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)


----------------------------------- VISUAL BLOCK ------------------------------

-- Moving text
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


------------------------------------- TERMINAL --------------------------------
keymap("t", "<Escape>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- italian keyboard utility
keymap('t', '<c-ì>', '~', {})
keymap('t', '<c-\'>', '`', {})
