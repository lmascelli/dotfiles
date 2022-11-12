local explorer_provider = require 'lm.core.providers.explorer'.explorer_provider

vim.g.netrw_winsize = 30
local explorer_win_id = nil

local show_explorer = function()
  vim.cmd ':Lex 30<cr>'
  explorer_win_id = vim.fn.win_getid()
  LM.providers.explorer_provider.shown = true
end

local hide_explorer = function()
  vim.fn.win_gotoid(explorer_win_id)
  vim.cmd ':q'
  LM.providers.explorer_provider.shown = false
end

local toggle_explorer = function()
  vim.cmd ':Lexplore'
end

LM.providers.explorer_provider = explorer_provider(show_explorer,
                                                   hide_explorer,
                                                   toggle_explorer)
