-- LEADER
vim.g.mapleader = " "


------------------------------------- NORMAL ----------------------------------

-- QUIT
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })

-- PROJECT
vim.keymap.set("n", '<leader>pt', '<cmd>terminal<cr>', { desc = 'Terminal' })
vim.keymap.set('n', '<leader>pc', '<cmd>lua LM.api.project.spawn_terminal()<cr>', {
  desc = 'spawn terminal here' })
vim.keymap.set("n", '<leader>pi', '<cmd>lua LM.api.project.init_local_nvim()<cr>', { desc = 'Init local conf' })
vim.keymap.set("n", '<leader>pl', '<cmd>lua LM.api.project.load_local_nvim()<cr>', { desc = 'Load local conf' })
vim.keymap.set("n", '<leader>pI', '<cmd>lua LM.api.project.install_local_git_plugin()<cr>',
  { desc = 'Install local plugin' })
-- vim.keymap.set("n", "<leader>pl", '<cmd>lua LM.api.project.project_lua()<cr>', {
--   silent = true,
--   nowait = true,
--   desc = "project.lua"
-- })
vim.keymap.set("n", "<leader>pp", '<cmd>lua LM.api.project.project_ps1()<cr>', {
  silent = true,
  nowait = true,
  desc = "project.ps1"
})

-- EXPLORER
vim.keymap.set("n", "<leader>e", "<cmd>lua LM.api.toggle_explorer()<cr>", { desc = "NetRw" })

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>c", ":lua LM.api.utils.edit_conf_dir(true)<cr>", { desc = "Open configuration" })

--  WINDOWS
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

-- TABS
vim.keymap.set("n", "<leader>tn", "<cmd>:tabnew<cr>", { desc = "New" })
vim.keymap.set("n", "<leader>td", "<cmd>:tabclose<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader><tab>", "<cmd>:tabnext<cr>", { desc = "Next tab" })

-- BUFFERS
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<leader>bf", "<cmd>:lua LM.api.buffer.format()<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>bd", "<cmd>:lua LM.api.buffer.delete()<cr>", { desc = "Delete" })

-- SEARCHING
vim.keymap.set('n', '<leader>fs', '/', { desc = 'Search' })
vim.keymap.set('n', '<leader>fr', ':%s/', { desc = 'replace' })
vim.keymap.set('n', '<leader>fh', '<cmd>nohl<cr>', { desc = 'highlight off' })

-- APPEARENCE
vim.keymap.set('n', '<leader>ac', '<cmd>lua LM.api.appearence.load_theme()<cr>', { desc = 'Colorcheme' })


-- ------------------------------------- INSERT ----------------------------------

--  <C-g> as Escape
vim.keymap.set("i", "<C-g>", "<Escape>", {})

vim.keymap.set("i", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("i", "<C-'>", "<C-k>'!", {})
vim.keymap.set("i", "<s-cr>", "<c-o>O", {})
vim.keymap.set("i", "<c-cr>", "<c-o>o", {})
vim.keymap.set("i", "<C-Space>", "<cmd>lua LM.api.complete()<cr>", {})
vim.keymap.set("i", "<C-_>", "<cmd>lua LM.api.complete()<cr>", {})

-- File saving
vim.keymap.set("i", "<C-s>", "<cmd>:w!<cr>", {})

vim.keymap.set("i", '<Left>', "")
vim.keymap.set("i", '<Right>', "")
vim.keymap.set("i", '<Up>', "")
vim.keymap.set("i", '<Down>', "")
vim.keymap.set("i", '<PageUp>', "")
vim.keymap.set("i", '<PageDown>', "")

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
