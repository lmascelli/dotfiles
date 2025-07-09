if vim.fn.has('nvim-0.9') == 1 then
  vim.loader.enable()
end

require 'config.settings'
require 'config.keymaps'
