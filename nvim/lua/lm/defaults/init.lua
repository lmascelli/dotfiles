local M = {}

M.keymaps = require 'lm.defaults.keymaps'.keymaps
M.load_options = require 'lm.defaults.options'.options
LM.complete = function()
  print 'No completion function has been set'
end
return M
