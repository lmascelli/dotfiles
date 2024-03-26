vim.opt.clipboard = "unnamedplus" -- system clipboard by default
vim.opt.cmdheight = 1             -- height of the commandline
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.cmd 'set omnifunc=ccomplete#Complete'
vim.opt.conceallevel = 0
vim.opt.cursorline = true                                           -- highlight the current line
vim.opt.exrc = true                                                 -- automatically load .nvim.lua in root folder
vim.opt.packpath = vim.opt.packpath + (vim.fn.getcwd() .. '/.nvim') -- add the .nvim local folder to manual plugins paths
vim.opt.foldmethod = "expr"                                         -- use treesitter based folding, "manual" otherwise
vim.opt.foldexpr = ""                                               -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.hidden = true                                               -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true                                             -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                                           -- ignore case in search patterns
vim.opt.mouse = 'a'                                                 -- allow the mouse to be used in neovim
vim.opt.pumheight = 10
vim.opt.showmatch = true
vim.opt.showmode = false -- hide current mode in statusbar
vim.opt.showtabline = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.foldlevelstart = 99
vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 500     -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true         -- set the window title to the buffer name
vim.opt.undofile = true      -- save undos
vim.opt.updatetime = 100     -- for faster completion
vim.opt.writebackup = false  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true     -- convert tabs to spaces
vim.opt.shiftwidth = 2       -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2          -- insert 2 spaces for a tab
vim.opt.iskeyword:remove{'_'} -- `_` character count as a words separator

-- junk files
vim.opt.backup = false   -- no backup files
vim.opt.swapfile = false -- no swapfiles

-- line number
vim.opt.number = true                                           -- show line numbers
vim.opt.relativenumber = true                                   -- show relative line numbers
vim.opt.numberwidth = 4                                         -- set number column width
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber" -- no line number in terminal mode

-- colorcolumn
vim.opt.colorcolumn = '0' -- column to highlight (0 to disable)

-- EOF indicator
vim.cmd ":set fillchars+=eob:\\ "

vim.opt.signcolumn = "auto"     -- show the sign column only if needed
vim.opt.wrap = false            -- display lines as one long line
vim.opt.scrolloff = 8           -- minimal number of screen lines to keep above and below the cursor.
-- vim.opt.sidescrolloff = 8       -- minimal number of screen lines to keep left and right of the cursor.
vim.opt.virtualedit = "onemore" -- let the cursor go one char after the end of the line
vim.opt.laststatus = 3          -- only a statusline for all windows

pcall(function()
-- file encoding
vim.opt.fileencoding = 'utf-8'
end)

-- used for find files in current path with :find
vim.cmd 'set path=**'
vim.cmd 'set wildignore+=*/.git/*'

-- Windows performace option
vim.o.fsync = false

local _border = "single"

-- floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = LM.icons.diagnostics.Error },
      { name = "DiagnosticSignWarn",  text = LM.icons.diagnostics.Warning },
      { name = "DiagnosticSignHint",  text = LM.icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo",  text = LM.icons.diagnostics.Information },
    },
  },
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = _border,
    source = "always",
    header = "",
    prefix = "",
  },
}

-- that is pure lunarvim knowledge
for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end
