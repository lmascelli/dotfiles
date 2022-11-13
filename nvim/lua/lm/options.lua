local options = {}

-------------------------------------------------------------------------------
-- default options
-------------------------------------------------------------------------------

options.defaults = {
  opts = {
    backup = false,
    clipboard = "unnamedplus",
    -- cmdheight = 2,
    completeopt = { "menu", "menuone", "noselect" },
    conceallevel = 0,
    --  fileencoding = "uft-8",
    ignorecase = true,
    mouse = 'a',
    pumheight = 10,
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
    virtualedit = "onemore",
  },
  settings = {
    colorcolumn = 80,
    terminal_line_number = false,
    EOF_indicator = false,
    italic_comments = true,
    no_fsync_on_win32 = true,
  }
}

-------------------------------------------------------------------------------
-- load options function
-------------------------------------------------------------------------------

options.load_options = function(opts, settings)
  for k, v in pairs(opts) do
    LM.g.opts[k] = v
  end

  for k, v in pairs(settings) do
    LM.g.settings[k] = v
  end
end

-------------------------------------------------------------------------------
-- apply options function
-------------------------------------------------------------------------------

options.apply_options = function(opts, settings)
  for k, v in pairs(opts) do
    vim.opt[k] = v
  end

  if settings.colorcolumn > 0 then
    vim.o.colorcolumn = tostring(settings.colorcolumn)
  end

  if not settings.terminal_line_number then
    -- no number in terminal mode
    vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"
  end

  if not settings.EOF_indicator then
    -- no EOF indicator ~
    vim.cmd ":set fillchars+=eob:\\ "
  end

  if settings.italic_comments then
    -- italic font for comments
    vim.cmd "highlight Comment cterm=italic gui=italic"
  end

  if vim.fn.has('win32') and settings.no_fsync_on_win32 then
    vim.o.fsync = false
  end
end

return options
