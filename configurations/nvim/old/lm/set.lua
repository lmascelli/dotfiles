------------------------------
--- buffer and text
------------------------------
vim.opt.colorcolumn = '0'          -- column to highlight (0 to disable)
vim.opt.conceallevel = 0
vim.opt.foldmethod = "expr"        -- use treesitter based folding, "manual" otherwise
vim.opt.foldexpr = ""              -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.foldlevelstart = 99
vim.opt.hidden = true              -- required to keep multiple buffers and open multiple buffers
vim.opt.signcolumn = "auto"        -- show the sign column only if needed
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.wrap = false               -- display lines as one long line
vim.opt.termguicolors = true       -- set term gui colors (most terminals support this)
vim.cmd ":set fillchars+=eob:\\ "  -- EOF indicator

------------------------------
--- clipboard
------------------------------
vim.opt.clipboard = "unnamedplus" -- system clipboard by default

------------------------------
--- command line
------------------------------
vim.opt.cmdheight = 1             -- height of the commandline

------------------------------
--- completion
------------------------------
vim.opt.pumheight = 10
vim.opt.updatetime = 100     -- for faster completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy') -- Use fuzzy matching for built-in completion
end
vim.cmd 'set omnifunc=ccomplete#Complete'

------------------------------
--- cursor
------------------------------
vim.opt.cursorline = true       -- highlight the current line
vim.opt.virtualedit = "onemore" -- let the cursor go one char after the end of the line

------------------------------
--- file encoding
------------------------------
pcall(function()
  vim.opt.fileencoding = 'utf-8'
end)

------------------------------
--- junk files
------------------------------
vim.opt.backup = false             -- no backup files
vim.opt.swapfile = false           -- no swapfiles
vim.opt.undofile = true            -- save undos
vim.opt.writebackup = false        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

------------------------------
--- line number
------------------------------
vim.opt.number = true                                           -- show line numbers
vim.opt.relativenumber = true                                   -- show relative line numbers
vim.opt.numberwidth = 4                                         -- set number column width
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber" -- no line number in terminal mode

------------------------------
--- searching
------------------------------
vim.opt.hlsearch = true   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.matchpairs:append("<:>")
vim.opt.smartcase = true
-- used for find files in current path with :find
vim.cmd 'set path=**'
vim.cmd 'set wildignore+=*/.git/*'

------------------------------
--- tab spaces
------------------------------
vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.shiftwidth = 2       -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2          -- insert 2 spaces for a tab

------------------------------
--- windows and scrolling
------------------------------
-- vim.opt.scrolloff = 8           -- minimal number of screen lines to keep above and below the cursor.
-- vim.opt.sidescrolloff = 8       -- minimal number of screen lines to keep left and right of the cursor.
vim.opt.laststatus = 3             -- only a statusline for all windows
vim.opt.splitbelow = true          -- force all horizontal splits to go below current window
vim.opt.splitright = true          -- force all vertical splits to go to the right of current window
vim.opt.title = true               -- modify the window title
vim.opt.titlestring = '%t'         -- set the window title to the buffer name
vim.opt.showmode = false           -- hide current mode in statusbar
vim.opt.showtabline = 1
vim.o.winborder = LM.appearence.floating_border_style

------------------------------
--- behaviour
------------------------------
vim.opt.exrc = true                                                 -- automatically load .nvim.lua in root folder
vim.opt.packpath = vim.opt.packpath + (vim.fn.getcwd() .. '/.nvim') -- add the .nvim local folder to manual plugins paths
vim.opt.mouse = 'a'                                                 -- allow the mouse to be used in neovim
vim.opt.timeoutlen = 500                                            -- time to wait for a mapped sequence to complete (in milliseconds)

------------------------------
--- Windows options
------------------------------
vim.o.fsync = false
