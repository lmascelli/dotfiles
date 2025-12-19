-- LEADER
vim.g.mapleader = " "

------------------------------------- NORMAL ----------------------------------

-- QUIT
vim.keymap.set("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit" })
vim.keymap.set("", "<c-z>", "")

-- EDIT
vim.keymap.set("n", "gh", "0", { desc = "Start of the line"})
vim.keymap.set("n", "gl", "$", { desc = "End of the line"})

-- PROJECT

-- EXPLORER

-- DIAGNOSTICS

-- VARIOUS
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {})
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "U", ":redo<cr>", {})
vim.keymap.set("n", "<tab>", "==", {})
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command mode" })
vim.keymap.set("n", "<leader>'", ":make ", { desc = "Shell command" })
vim.keymap.set("n", "<C-'>", ":make ", { desc = "Shell command" })

--  WINDOWS
vim.keymap.set('n', '<m-ScrollWheelUp>', 'zhzh', { desc = "" })
vim.keymap.set('n', '<m-ScrollWheelDown>', 'zlzl', { desc = "" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "" })

-- BUFFERS
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "" })
vim.keymap.set("n", "<leader>bf", "<cmd>:lua require('core.utils').format_buffer()<cr>", { desc = "Format" })
vim.keymap.set("n", "<leader>bd", "<cmd>:lua require('core.utils').delete_buffer()<cr>", { desc = "Delete" })

-- SEARCHING
vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find file' })
vim.keymap.set('n', '<leader>fh', '<cmd>nohl<cr>', { desc = 'highlight off' })
vim.keymap.set('n', '<C-h>', '<cmd>nohl<cr>', { desc = 'highlight off' })

-- APPEARENCE

-- SOME EMACSY keymaps
--  <C-g> as Escape
vim.keymap.set("n", "<C-g>", "<Escape>", {})
vim.keymap.set("n", "<M-x>", ":lua ", {})

-- tab management
vim.keymap.set("n", "<C-c>tn", "<cmd>:tabnew<cr>", {})
vim.keymap.set("n", "<C-c>t0", "<cmd>:tabclose<cr>", {})

-- ------------------------------------- INSERT ----------------------------------

-- dumb autopair
vim.keymap.set("i", "(", "()<esc>i", {})
vim.keymap.set("i", "[", "[]<esc>i", {})
vim.keymap.set("i", "{", "{}<esc>i", {})
vim.keymap.set("i", '"', '""<esc>i', {})

--  <C-g> as Escape
vim.keymap.set("i", "<C-g>", "<Escape>", {})
vim.keymap.set("i", "<C-ì>", "<C-k>'?", {})
vim.keymap.set("i", "<C-'>", "<C-k>'!", {})
vim.keymap.set("i", "<s-cr>", "<c-o>O", {})
vim.keymap.set("i", "<c-cr>", "<c-o>o", {})

-- ------------------------------------- VISUAL ----------------------------------

--  <C-g> as Escape
vim.keymap.set("x", "<C-g>", "<Escape>", {})

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

-- Indenting
vim.keymap.set("x", "<tab>", "=", {})

-- Eval region
vim.keymap.set("x", "g,", "<cmd>lua LM.utils.eval_region()<cr>", {})

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
