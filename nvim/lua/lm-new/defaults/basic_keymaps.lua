local keymap_provider = LM.providers.keymap_provider
local term_opts = { silent = true }

local function set_keymap(mode, map, cmd, opts, buf)
  keymap_provider.set_keymap(
    keymap_provider.keymap_struct(
      mode, map, cmd, opts
    ), buf)
end

-- set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


--------------------------------------  NORMAL --------------------------------

--  Window moving
set_keymap("n", "<C-h>", "<C-w>h", opts)
set_keymap("n", "<C-j>", "<C-w>j", opts)
set_keymap("n", "<C-k>", "<C-w>k", opts)
set_keymap("n", "<C-l>", "<C-w>l", opts)
set_keymap('n', '<leader>wv', '<C-w>v', opts)
set_keymap('n', '<leader>ws', '<C-w>s', opts)
set_keymap('n', '<leader>wc', '<cmd>q<cr>', opts)
set_keymap('n', '<leader>wo', '<cmd>only<cr>', opts)
set_keymap('n', '<leader>qq', '<cmd>qa!<cr>', opts)
set_keymap('n', '<m-ScrollWheelUp>', 'zhzh', opts)
set_keymap('n', '<m-ScrollWheelDown>', 'zlzl', opts)

--  File explorer
set_keymap("n", "<leader>e", ":lua LM.providers.explorer_provider.toggle()<cr>", opts)

--  Window resizing
set_keymap("n", "<C-+>", ":lua vim.g.lm.increase_font_size()<cr>", opts)
set_keymap("n", "<C-->", ":lua vim.g.lm.decrease_font_size()<cr>", opts)

set_keymap("n", "<C-Up>", ":resize +2<cr>", opts)
set_keymap("n", "<C-Down>", ":resize -2<cr>", opts)
set_keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
set_keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Buffer navigation
set_keymap("n", "<S-l>", ":bnext<cr>", opts)
set_keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Buffer editing
set_keymap("n", "<C-s>", ":w<cr>", opts)
set_keymap("n", "U", ":redo<cr>", opts)

-- Script evaluating
set_keymap('n', '<leader>vc', '<cmd>source %<cr>', {})
set_keymap('n', '<leader>vr', '<cmd>lua vim.g.lm.reload_vimrc()<cr>', {
  silent = true,
  nowait = true,
})
set_keymap('n', '<leader>vl', '<cmd>lua vim.g.lm.project_lua()<cr>', {
  silent = true,
  nowait = true,
})
set_keymap('n', '<leader>vp', '<cmd>lua vim.g.lm.project_ps1()<cr>', {
  silent = true,
  nowait = true,
})

------------------------------------- INSERT ----------------------------------

set_keymap("i", "<C-ì>", "<C-k>'?", opts)
set_keymap("c", "<C-ì>", "<C-k>'?", opts)
set_keymap("i", "<C-'>", "<C-k>'!", opts)
set_keymap("c", "<C-'>", "<C-k>'!", opts)
set_keymap("i", "<s-cr>", "<c-o>O", opts)
set_keymap("i", "<c-cr>", "<c-o>o", opts)

-- Completion
set_keymap("i", "<C-Space>", "<C-x><C-o>", opts)

-- File saving
set_keymap("i", "<C-s>", "<cmd>:w<cr>", opts)


------------------------------------- VISUAL ----------------------------------

-- Moving text
set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
set_keymap("v", "p", '"_dP', opts)


----------------------------------- VISUAL BLOCK ------------------------------

-- Moving text
set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


------------------------------------- TERMINAL --------------------------------
set_keymap("t", "<Escape>", "<C-\\><C-n>", term_opts)
set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- italian keyboard utility
set_keymap('t', '<c-ì>', '~', {})
set_keymap('t', '<c-\'>', '`', {})
