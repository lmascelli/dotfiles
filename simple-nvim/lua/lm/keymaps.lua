-- LEADER
vim.g.mapleader = " "


------------------------------------- NORMAL ----------------------------------

-- QUIT
vim.keymap.set("n", "<leader>q", function() end, { desc = "+Quit" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })

-- PROJECT
vim.keymap.set("n", "<leader>p", function() end, { desc = "+Project" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "NetRw" })
vim.keymap.set("n", '<leader>pt', '<cmd>terminal<cr>', { desc = 'Terminal' })
vim.keymap.set('n', '<leader>pc', '<cmd>lua require("lm.api.project").spawn_terminal()<cr>', {
  desc = 'spawn terminal here' })
vim.keymap.set("n", "<leader>pl", '<cmd>lua require("lm.api.project").project_lua()<cr>', {
  silent = true,
  nowait = true,
  desc = "project.lua"
})
vim.keymap.set("n", "<leader>pp", '<cmd>lua require("lm.api.project").project_ps1()<cr>', {
  silent = true,
  nowait = true,
  desc = "project.ps1"
})

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>cc", ":lua require('lm.api.project').edit_conf_dir(true)<cr>", { desc = "Open configuration" })

--  WINDOWS
vim.keymap.set("n", "<leader>w", function() end, { desc = "+Window" })
vim.keymap.set('n', '<leader>wc', '<cmd>q<cr>', { desc = "Close" })
vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = "Close others" })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = "Split vertical" })
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = "Split horizontal" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go right" })
vim.keymap.set("n", "<A-Left>", "<C-w>h", { desc = "Go left" })
vim.keymap.set("n", "<A-Down>", "<C-w>j", { desc = "Go down" })
vim.keymap.set("n", "<A-Up>", "<C-w>k", { desc = "Go up" })
vim.keymap.set("n", "<A-Right>", "<C-w>l", { desc = "Go right" })
vim.keymap.set('n', '<m-ScrollWheelUp>', 'zhzh', { desc = "" })
vim.keymap.set('n', '<m-ScrollWheelDown>', 'zlzl', { desc = "" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "" })

-- BUFFERS
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<leader>b", function() end, { desc = "+Buffer" })
vim.keymap.set("n", "<leader>bf", "<cmd>:lua require('lm.api.buffer').format()<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>bd", "<cmd>:lua require('lm.api.buffer').delete()<cr>", { desc = "Delete" })

-- SEARCHING
vim.keymap.set('n', '<leader>f', function() end, { desc = '+Find' })
vim.keymap.set('n', '<leader>fs', '/', { desc = 'Search' })
vim.keymap.set('n', '<leader>fr', ':%s/', { desc = 'replace' })
vim.keymap.set('n', '<leader>fh', '<cmd>nohl<cr>', { desc = 'highlight off' })

-- -- Configuration
-- keymap('n', '<leader>c', '', opts, buf, 'Configuration')
-- keymap('n', '<leader>cs', '<cmd>source %<cr>', {}, buf, 'Source this file')
-- keymap('n', '<leader>cp', ':lua LM.plugins.add_template()<cr>', {}, buf, 'Create plugin from template')
-- keymap('n', '<leader>cd', ':lua LM.edit_conf_dir(true)<cr>', {}, buf, 'Open configuration directory')
-- keymap('n', '<leader>cc', ':lua LM.edit_conf_file()<cr>', {}, buf, 'Open configuration file')


-- ------------------------------------- INSERT ----------------------------------

--  <C-g> as Escape
vim.keymap.set("i", "<C-g>", "<Escape>", {})

vim.keymap.set("i", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("i", "<C-'>", "<C-k>'!", {})
vim.keymap.set("i", "<s-cr>", "<c-o>O", {})
vim.keymap.set("i", "<c-cr>", "<c-o>o", {})

-- File saving
vim.keymap.set("i", "<C-s>", "<cmd>:w!<cr>", {})


-- ------------------------------------- VISUAL ----------------------------------

--  <C-g> as Escape
vim.keymap.set("t", "<C-g>", "<Escape>", {})

-- Moving text
vim.keymap.set("x", "<A-j>", ":m .+1<CR>==", {})
vim.keymap.set("x", "<A-k>", ":m .-2<CR>==", {})
vim.keymap.set("x", "p", '"_dP', {})

-- Surrounding selected text
vim.cmd ':vnoremap s <Nop>'
vim.keymap.set("x", "s(", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s)", '"9xi()<escape>h"9p', {})
vim.keymap.set("x", "s[", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "s]", '"9xi[]<escape>h"9p', {})
vim.keymap.set("x", "sc", '"9xi{}<escape>h"9p', {})
vim.keymap.set("x", "s'", "\"9xi''<escape>h\"9p", {})
vim.keymap.set("x", 's"', '"9xi""<escape>h"9p', {})

-- Moving text
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", {})
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", {})


------------------------------   COMMAND LINE ---------------------------------

--  <C-g> as Escape
vim.keymap.set("c", "<C-g>", "<Escape>", {})
vim.keymap.set("c", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("c", "<C-'>", "<C-k>'!", {})


------------------------------------- TERMINAL --------------------------------

vim.keymap.set("t", "<Escape>", "<C-\\><C-n>", {})
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", {})

-- italian keyboard utility
vim.keymap.set('t', '<c-ì>', '~', {})
vim.keymap.set('t', '<c-\'>', '`', {})
