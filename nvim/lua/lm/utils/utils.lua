local append = function(key, value)  
  local lm = vim.g.lm
  lm[key] = value
  vim.g.lm = lm
end

append('append', append)

require 'lm.utils.buffer_edit'
require 'lm.utils.explorer_builtin'
require 'lm.utils.font'
require 'lm.utils.scripts'
