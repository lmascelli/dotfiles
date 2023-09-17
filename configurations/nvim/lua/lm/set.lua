vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 10
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.foldlevelstart = 99
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
-- vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true

-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
-- no line number in terminal mode
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"

-- colorcolumn
vim.opt.colorcolumn = '0'

-- EOF indicator
vim.cmd ":set fillchars+=eob:\\ "

vim.opt.signcolumn = "auto"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.virtualedit = "onemore"
-- only a statusline for all windows
vim.opt.laststatus = 3

-- used for find files in current path with :find
vim.o.path = vim.o.path .. '**'

-- Windows performace option
vim.o.fsync = false
