local M = {}

M.keymaps = function()
  local keymap = LM.keymaps.add_map

  local opts = { noremap = true, silent = true }
  local term_opts = { silent = true }
  local buf = nil

  -- keymap("", "<Space>", "<Nop>", opts, buf, '')

  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  --------------------------------------  NORMAL --------------------------------


  --  <C-g> as Escape
  keymap("n", "<C-g>", "<Escape>", opts, buf, '')

  --  Window navigation
  keymap("n", "<leader>w", "", opts, buf, "Window")
  keymap('n', '<leader>wc', '<cmd>q<cr>', opts, buf, 'Close window')
  keymap('n', '<leader>wo', '<cmd>only<cr>', opts, buf, 'Close other windows')
  keymap('n', '<leader>wv', '<C-w>v', opts, buf, 'Split vertical')
  keymap('n', '<leader>ws', '<C-w>s', opts, buf, 'Split horizontal')
  keymap("n", "<C-h>", "<C-w>h", opts, buf, 'Window left')
  keymap("n", "<C-j>", "<C-w>j", opts, buf, 'Window down')
  keymap("n", "<C-k>", "<C-w>k", opts, buf, 'Window up')
  keymap("n", "<C-l>", "<C-w>l", opts, buf, 'Window right')
  keymap("n", "<A-Left>", "<C-w>h", opts, buf, 'Window left')
  keymap("n", "<A-Down>", "<C-w>j", opts, buf, 'Window down')
  keymap("n", "<A-Up>", "<C-w>k", opts, buf, 'Window up')
  keymap("n", "<A-Right>", "<C-w>l", opts, buf, 'Window right')
  keymap('n', '<leader>qq', '<cmd>qa!<cr>', opts, buf, 'Quit')
  keymap('n', '<m-ScrollWheelUp>', 'zhzh', opts, buf, '')
  keymap('n', '<m-ScrollWheelDown>', 'zlzl', opts, buf, '')

  --  File explorer
  keymap("n", "<leader>e", ":lua LM.explorer.toggle_explorer()<cr>", opts, buf, 'Explorer')

  --  Window resizing
  keymap("n", "<C-+>", ":lua LM.font.increase_font_size()<cr>", opts, buf, 'Increase Font')
  keymap("n", "<C-->", ":lua LM.font.decrease_font_size()<cr>", opts, buf, 'Decrease Font')

  keymap("n", "<C-Up>", ":resize +2<cr>", opts, buf, '')
  keymap("n", "<C-Down>", ":resize -2<cr>", opts, buf, '')
  keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts, buf, '')
  keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts, buf, '')

  -- Buffer navigation
  keymap("n", "<S-l>", ":bnext<cr>", opts, buf, '')
  keymap("n", "<S-h>", ":bprevious<cr>", opts, buf, '')
  keymap("n", "<leader>b", "", opts, buf, "Buffer")
  keymap("n", "<leader>bd", "<cmd>:lua LM.buffer_delete()<cr>", opts, buf, "Delete buffer")

  -- Buffer editing
  keymap("n", "<C-s>", ":w!<cr>", opts, buf, '')
  keymap("n", "U", ":redo<cr>", opts, buf, '')

  -- Processes
  keymap('n', '<leader>v', '', opts, buf, 'Processes')
  keymap('n', '<leader>vl', '<cmd>lua LM.project_lua()<cr>', {
    silent = true,
    nowait = true,
  }, buf, 'project.lua')
  keymap('n', '<leader>vp', '<cmd>lua LM.project_ps1()<cr>', {
    silent = true,
    nowait = true,
  }, buf, 'project.ps1')
  keymap('n', '<leader>vc', '<cmd>lua LM.spawn_terminal()<cr>', nil, buf,
    'spawn terminal here')

  -- Configuration
  keymap('n', '<leader>c', '', opts, buf, 'Configuration')
  keymap('n', '<leader>cs', '<cmd>source %<cr>', {}, buf, 'Source this file')
  keymap('n', '<leader>cp', ':lua LM.plugins.add_template()<cr>', {}, buf, 'Create plugin from template')
  keymap('n', '<leader>cd', ':lua LM.edit_conf(true)<cr>', {}, buf, 'Open configuration directory')

  -- Appearence
  keymap('n', '<leader>a', '', opts, buf, 'Appearence')
  keymap('n', '<leader>a+', ':lua LM.font.increase_font_size()<cr>', opts, buf, 'Increase font')
  keymap('n', '<leader>a-', ':lua LM.font.decrease_font_size()<cr>', opts, buf, 'Decrease font')
  keymap('n', '<leader>ac', ':Telescope colorscheme enable_preview=true<cr>', opts, buf, 'Colorscheme')

  -- Searching
  local search_opts = opts
  search_opts.silent = false
  keymap('n', '<leader>s', '', opts, buf, 'Search')
  keymap('n', '<leader>ss', '/', search_opts, buf, 'search')
  keymap('n', '<leader>sr', ':%s/', search_opts, buf, 'replace')
  keymap('n', '<leader>sh', '<cmd>nohl<cr>', search_opts, buf, 'highlight off')

  ------------------------------------- INSERT ----------------------------------

  --  <C-g> as Escape
  keymap("i", "<C-g>", "<Escape>", opts, buf, '')

  keymap("i", "<C-ì>", "<C-k>'?", opts, buf, '')
  keymap("c", "<C-ì>", "<C-k>'?", opts, buf, '')
  keymap("i", "<C-'>", "<C-k>'!", opts, buf, '')
  keymap("c", "<C-'>", "<C-k>'!", opts, buf, '')
  keymap("i", "<s-cr>", "<c-o>O", opts, buf, '')
  keymap("i", "<c-cr>", "<c-o>o", opts, buf, '')

  -- -- Completion
  keymap("i", "<C-@>", "<cmd>:lua LM.complete()<cr>", opts, buf, '')

  -- File saving
  keymap("i", "<C-s>", "<cmd>:w!<cr>", opts, buf, '')

  ------------------------------------- VISUAL ----------------------------------

  --  <C-g> as Escape
  keymap("t", "<C-g>", "<Escape>", opts, buf, '')

  -- Moving text
  keymap("v", "<A-j>", ":m .+1<CR>==", opts, buf, '')
  keymap("v", "<A-k>", ":m .-2<CR>==", opts, buf, '')
  keymap("v", "p", '"_dP', opts, buf, '')


  ----------------------------------- VISUAL BLOCK ------------------------------

  --  <C-g> as Escape
  keymap("t", "<C-g>", "<Escape>", opts, buf, '')

  -- Moving text
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts, buf, '')
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts, buf, '')
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts, buf, '')
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts, buf, '')


  ------------------------------------- TERMINAL --------------------------------

  keymap("t", "<Escape>", "<C-\\><C-n>", term_opts, buf, '')
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts, buf, '')
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts, buf, '')
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts, buf, '')
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts, buf, '')


  -- italian keyboard utility
  keymap('t', '<c-ì>', '~', {})
  keymap('t', '<c-\'>', '`', {})
end

return M
