LM = {
  font = {
    font_name = 'Cascadia Code',
    font_size = 10,
  },
  lsp = {
    on_attach = {}
  },
  icons = require 'lm.runtime.icons',
  augroups = {
    colorscheme = vim.api.nvim_create_augroup("Colorscheme", {
      clear = true,
    }),
    gui = vim.api.nvim_create_augroup("Gui", {
      clear = true,
    }),
    lsp_menu = vim.api.nvim_create_augroup("LspMenu", {
      clear = true,
    }),
  },
  appearence = {
    colorscheme = 'default',
    transparency = false,
  },
  api = {
    complete = function()
      -- TODO make omnifunc the default completion method
    end
  }
}

require 'lm.runtime.lsp'
require 'lm.runtime.api.utils'
require 'lm.runtime.api.buffer'
require 'lm.runtime.api.project'
require 'lm.runtime.api.appearence'
