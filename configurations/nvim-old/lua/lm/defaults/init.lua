-- set default keymaps
require 'lm.defaults.keymaps'
-- set default options
require 'lm.defaults.options'

LM.complete = function()
  local keys = vim.api.nvim_replace_termcodes(
      '<c-x><c-o>', true, false, true)
  vim.api.nvim_feedkeys(keys, 'i', false)
end
