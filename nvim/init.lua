if vim.fn.has('win32') then
   vim.o.fsync = false
end
vim.g.lm = {}
require 'lm.options'
require 'lm.utils.utils'
require 'lm.plugins'
require 'lm.keymaps'
if vim.g.neovide then
  require 'lm.neovide'
end
require 'lm.colorscheme'

local after = require('lm_settings').after
if after then
  after()
end
