-- local main_file = 'lua/start.lua'
local main_file = 'main.vim'
vim.cmd.source(vim.fn.stdpath('config') .. '/' .. main_file)
