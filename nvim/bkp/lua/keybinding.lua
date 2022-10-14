-- BASIC KEYBINDINGS --

local keymap = vim.api.nvim_set_keymap

-- Leader key --
vim.g.mapleader = ' '


if vim.g.whichkey then

    keymap("n", "<c-s>" , "<cmd>:w<cr>",{})
    keymap("i", "<c-s>" , "<cmd>:w<cr>",{})

    local wk = require 'which-key'
    wk.register ({
    ['<leader>'] = {
    w = {
      name = '+Window',
      h = { '<c-w>h', 'Left' },
      l = { '<c-w>l', 'Right' },
      j = { '<c-w>j', 'Down' },
      k = { '<c-w>k', 'Up' },
      v = { '<cmd>vsplit<cr>', 'VSplit' },
      o = { '<cmd>split<cr>', 'HSplit' },
    },
    b = {
      name = "+Buffer",
      d = { '<cmd>bd!<cr>', 'Delete' },
      s = { '<cmd>:w<cr>', 'Save' },
      S = { ':w ', 'Save As' },
      a = { '<cmd>wa<cr>', 'Save All' },
      l = { '<cmd>buffers<cr>', 'List buffers' },
    },
    s = {
      name = "+Search",
      s = {'/', 'Search', silent=false},
      r = {':%s/', 'Search', silent=false},
      h = {'<cmd>nohl<cr>', 'highlight off'},
    },
    v = {
      name = '+Script',
      c = { '<cmd>source %<cr>', 'Source current file' },
      r = { '<cmd>call g:reload_vimrc()<cr>', 'Reload configuration'},
      l = { '<cmd>call g:project_lua()<cr>', 'run project.lua'},
      p = { '<cmd>call g:project_ps1()<cr>', 'run project.ps1'},
    },
    q = {
      name = '+Quit',
      q = { '<cmd>q<cr>', 'Quit current window' },
      Q = { '<cmd>qa!<cr>', 'Quit' },
    },
    a = {
      name = '+Apparence',
      ['+'] = {'<cmd>lua vim.g.increase_font()<cr>', 'increase font'},
      ['-'] = {'<cmd>lua vim.g.decrease_font()<cr>', 'decrease font'},
      d = {'<cmd>set background=dark<cr>', 'background dark'},
      l = {'<cmd>set background=light<cr>', 'background light'},
    }
    }
    }, {silent = true})

else

    -- Window key

    keymap('n', '<leader>wh', '<c-w>h', {})
    keymap('n', '<leader>wl', '<c-w>l', {})
    keymap('n', '<leader>wj', '<c-w>j', {})
    keymap('n', '<leader>wk', '<c-w>k', {})
    keymap('n', '<leader>wv', '<cmd>vsplit<cr>', {})
    keymap('n', '<leader>wo', '<cmd>split<cr>', {})

    -- Buffer key

    keymap('n', '<leader>bd', '<cmd>bd!<cr>', {})
    keymap('n', '<leader>bs', '<cmd>:w<cr>', {})
    keymap('n', '<c-s>', '<cmd>:w<cr>', {})
    keymap('n', '<leader>bl', '<cmd>buffers<cr>', {})
    keymap('n', '<leader>b1', '<cmd>b1<cr>', {})
    keymap('n', '<leader>b2', '<cmd>b2<cr>', {})
    keymap('n', '<leader>b3', '<cmd>b3<cr>', {})
    keymap('n', '<leader>b4', '<cmd>b4<cr>', {})
    keymap('n', '<leader>b5', '<cmd>b5<cr>', {})
    keymap('n', '<leader>b6', '<cmd>b6<cr>', {})
    keymap('n', '<leader>b7', '<cmd>b7<cr>', {})
    keymap('n', '<leader>b8', '<cmd>b8<cr>', {})
    keymap('n', '<leader>b9', '<cmd>b9<cr>', {})

    -- Search key
 
    keymap('n', '<leader>ss', ':%s/', {silent=false})
    keymap('n', '<leader>sh', '<cmd>nohl<cr>', {silent=false})

    -- Utility keybindings

    keymap('n', '<leader>vl', '<cmd>source %<cr>', {})
    keymap('n', '<leader>vr', '<cmd>call g:reload_vimrc()<cr>', {
  silent = true,
  nowait = true,
    })
    keymap('n', '<leader>qq', '<cmd>q<cr>', {})
    keymap('n', '<leader>qQ', '<cmd>qa!<cr>', {})

    -- Horizontal Scrolling with mouse

end

-- NOT WHICH-KEY keybinds

-- saving
keymap('i', '<c-s>', '<cmd>:w<cr>', {})
-- completion
keymap('i', '<c-space>', '<c-x><c-o>', {})
-- horiziontal scrolling
keymap('n', '<m-ScrollWheelUp>', 'zhzh', {})
keymap('n', '<m-ScrollWheelDown>', 'zlzl', {})
-- terminal
keymap('t', '<escape>', '<c-\\><c-n>', {})
keymap('t', '<c-ì>', '~', {})
keymap('t', '<c-\'>', '`', {})
-- window resize
keymap('n', '<c-left>', '<cmd>vertical resize -2<cr>', {})
keymap('n', '<c-right>', '<cmd>vertical resize +2<cr>', {})
keymap('n', '<c-up>', '<cmd>resize -2<cr>', {})
keymap('n', '<c-down>', '<cmd>resize +2<cr>', {})
return {}
