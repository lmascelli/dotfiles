local M = {}

M.options = function()
  local options = require 'lm.options'

  -- default options
  -------------------------------------------------------------------------------
  -------------------------------------------------------------------------------
  local defaults = {
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
      foldlevelstart = 99,
      splitbelow = true,
      splitright = true,
      swapfile = false,
      termguicolors = false,
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

  options.load_options(defaults.opts, defaults.settings)
end

return M
