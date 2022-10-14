local current_settings = require 'lm_settings'
local append = vim.g.lm['append']

append('explorer_visible', false)

append('show_explorer', function()
  vim.cmd ':Lex 30<cr>'
  append('explorer_id', vim.fn.win_getid())
  append('explorer_visible', true)
end)

append('hide_explorer', function()
  vim.fn.win_gotoid(vim.g.lm['explorer_id'])
  vim.cmd ':q'
  append('explorer_visible', false)
end)


append('toggle_explorer', function()
  if vim.g.lm['explorer_visible'] then 
    vim.g.lm['hide_explorer']() 
  else 
    vim.g.lm['show_explorer']() 
  end
end
)

