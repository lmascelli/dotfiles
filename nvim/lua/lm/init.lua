if vim.fn.has('win32') then
   vim.o.fsync = false
end
LM = {}
-- defaults providers
require 'lm.keymaps'
require 'lm.explorer'

require 'lm.options'
require 'lm.utils.utils'
require 'lm.plugins'
if vim.g.neovide then
  require 'lm.neovide'
end
require 'lm.colorscheme'
require 'lm.filetypes'

local after = require('lm_settings').after
if after then
  after()
end
