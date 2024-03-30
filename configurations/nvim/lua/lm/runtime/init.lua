LM = {
  appearence = {
    colorscheme = 'default',
    transparency = false,
    lines = 40,
    columns = 90,
  },
  api = {
    complete = function()
      vim.opt.iskeyword:remove{'_'} 
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
      vim.opt.iskeyword:append{'_'} 
    end
  },
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
  buffer = {
    c_style_separator = false,
  },
  font = {
    font_name = '',
    font_size = 10,
  },
  plugins = {
    with_which_key = false,
    with_lsp = false,
    with_coc = false,
    files_list = {},
    table = {},
  },
  lsp = {
    on_attach = {}
  },
}

require 'lm.runtime.icons'
require 'lm.runtime.lsp'
require 'lm.runtime.api.utils'
require 'lm.runtime.api.buffer'
require 'lm.runtime.api.project'
require 'lm.runtime.api.appearence'
require 'lm.runtime.api.completion'
