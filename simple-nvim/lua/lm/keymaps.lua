-- LEADER
vim.g.mapleader = " "

-- QUIT
vim.keymap.set("n", "<leader>q", function() end, { desc = "+Quit" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })

-- PROJECT
vim.keymap.set("n", "<leader>p", function() end, { desc = "+Project" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "NetRw" })
vim.keymap.set("n", "<leader>pl", "<cmd>lua LM.project_lua()<cr>", {
  silent = true,
  nowait = true,
  desc = "project.lua"
})
vim.keymap.set("n", "<leader>pp", "<cmd>lua LM.project_ps1()<cr>", {
  silent = true,
  nowait = true,
  desc = "project.ps1"
})

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })

--  Window navigation
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

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<leader>b", function() end, { desc = "+Buffer" })
vim.keymap.set("n", "<leader>bf", "<cmd>:lua LM.api.buffer_format()<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>bd", "<cmd>:lua LM.api.buffer_delete()<cr>", { desc = "Delete" })
vim.keymap.set("n", "<leader>bl", "<cmd>:lua LM.api.buffer_list()<cr>", { desc = "List" })

--
-- -- Configuration
-- keymap('n', '<leader>c', '', opts, buf, 'Configuration')
-- keymap('n', '<leader>cs', '<cmd>source %<cr>', {}, buf, 'Source this file')
-- keymap('n', '<leader>cp', ':lua LM.plugins.add_template()<cr>', {}, buf, 'Create plugin from template')
-- keymap('n', '<leader>cd', ':lua LM.edit_conf_dir(true)<cr>', {}, buf, 'Open configuration directory')
-- keymap('n', '<leader>cc', ':lua LM.edit_conf_file()<cr>', {}, buf, 'Open configuration file')
--
-- -- Appearence
-- keymap('n', '<leader>a', '', opts, buf, 'Appearence')
-- keymap('n', '<leader>a+', ':lua LM.font.increase_font_size()<cr>', opts, buf, 'Increase font')
-- keymap('n', '<leader>a-', ':lua LM.font.decrease_font_size()<cr>', opts, buf, 'Decrease font')
-- keymap('n', '<leader>at', '', opts, buf, 'Toggle')
-- keymap('n', '<leader>atc', ':lua LM.api.toggle_colorcolumn()<cr>', opts, buf, 'Toggle colorcolumn')
-- keymap('n', '<leader>atn', ':lua LM.api.toggle_linenumber()<cr>', opts, buf, 'Toggle line numbers')
-- keymap('n', '<leader>ac', ':lua LM.api.list_colorschemes()<cr>', opts, buf, 'Colorscheme')
--
-- -- Searching
-- local search_opts = opts
-- search_opts.silent = false
-- keymap('n', '<leader>s', '', opts, buf, 'Search')
-- keymap('n', '<leader>ss', '/', search_opts, buf, 'search')
-- keymap('n', '<leader>sr', ':%s/', search_opts, buf, 'replace')
-- keymap('n', '<leader>sh', '<cmd>nohl<cr>', search_opts, buf, 'highlight off')
--
-- -- Templates
-- keymap('n', '<leader>,', '', opts, buf, 'Templates')
-- keymap('n', '<leader>,b', '<cmd>lua LM.comments.insert()<cr>', opts, buf, 'block')
--
-- -- Tools
-- keymap('n', '<leader>t', '', opts, buf, 'Tools')
-- keymap('n', '<leader>tt', '<cmd>terminal<cr>', opts, buf, 'integrated terminal')
-- keymap('n', '<leader>tc', '<cmd>lua LM.spawn_terminal()<cr>', nil, buf,
--   'spawn terminal here')
--
-- ------------------------------------- INSERT ----------------------------------
--
-- --  <C-g> as Escape
-- keymap("i", "<C-g>", "<Escape>", opts, buf, '')
--
-- keymap("i", "<C-ì>", "<C-k>'?", opts, buf, '')
-- keymap("c", "<C-ì>", "<C-k>'?", opts, buf, '')
-- keymap("i", "<C-'>", "<C-k>'!", opts, buf, '')
-- keymap("c", "<C-'>", "<C-k>'!", opts, buf, '')
-- keymap("i", "<s-cr>", "<c-o>O", opts, buf, '')
-- keymap("i", "<c-cr>", "<c-o>o", opts, buf, '')
--
-- -- -- Completion
-- keymap("i", "<C-_>", "<cmd>:lua LM.complete()<cr>", opts, buf, '')
--
-- -- File saving
-- keymap("i", "<C-s>", "<cmd>:w!<cr>", opts, buf, '')
--
-- ------------------------------------- VISUAL ----------------------------------
--
-- --  <C-g> as Escape
-- keymap("t", "<C-g>", "<Escape>", opts, buf, '')
--
-- -- Moving text
-- keymap("x", "<A-j>", ":m .+1<CR>==", opts, buf, '')
-- keymap("x", "<A-k>", ":m .-2<CR>==", opts, buf, '')
-- keymap("x", "p", '"_dP', opts, buf, '')
--
-- -- Surrounding selected text
-- vim.cmd ':vnoremap s <Nop>'
-- keymap("x", "s(", '"9xi()<escape>h"9p', opts, buf, '')
-- keymap("x", "s)", '"9xi()<escape>h"9p', opts, buf, '')
-- keymap("x", "s[", '"9xi[]<escape>h"9p', opts, buf, '')
-- keymap("x", "s]", '"9xi[]<escape>h"9p', opts, buf, '')
-- keymap("x", "sc", '"9xi{}<escape>h"9p', opts, buf, '')
-- keymap("x", "s'", "\"9xi''<escape>h\"9p", opts, buf, '')
-- keymap("x", 's"', '"9xi""<escape>h"9p', opts, buf, '')
--
-- ----------------------------------- VISUAL BLOCK ------------------------------
--
-- --  <C-g> as Escape
-- keymap("t", "<C-g>", "<Escape>", opts, buf, '')
--
-- -- Moving text
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts, buf, '')
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts, buf, '')
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts, buf, '')
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts, buf, '')
--
-- ------------------------------   COMMAND LINE ---------------------------------
--
-- --  <C-g> as Escape
-- keymap("c", "<C-g>", "<Escape>", opts, buf, '')
--
-- ------------------------------------- TERMINAL --------------------------------
--
-- keymap("t", "<Escape>", "<C-\\><C-n>", term_opts, buf, '')
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts, buf, '')
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts, buf, '')
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts, buf, '')
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts, buf, '')
--
--
-- -- italian keyboard utility
-- keymap('t', '<c-ì>', '~', {})
-- keymap('t', '<c-\'>', '`', {})
