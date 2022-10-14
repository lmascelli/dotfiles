local opt = vim.opt

local options = {

  backup = false,
  clipboard = "unnamedplus",
  -- cmdheight = 2,
  completeopt = {"menu", "menuone","noselect"},
  conceallevel = 0,
  --  fileencoding = "uft-8",
  ignorecase = true,
  mouse = 'a',
  pumheight = 10,
  -- color column 80
  showmatch = true,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "auto",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
}

for key, value in pairs(options) do
  opt[key] = value
end

local set = vim.o

local settings = {
  colorcolumn = "80",
}

for key, value in pairs(settings) do
  set[key] = value
end

-- no number in terminal mode
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"

-- no EOF indicator ~ 
vim.cmd ":set fillchars+=eob:\\ "

-- italic font for comments
vim.cmd "highlight Comment cterm=italic gui=italic"
