if vim.fn.has('nvim-0.9') == 1 then
  vim.loader.enable()
end

require 'core'
local utils = require 'core.utils'

require 'config.settings'
require 'config.keymaps'
require 'config.appearence'
require 'config.lsp'

utils.load_custom_file()
