local packer = require 'packer'

local install = function()
  packer.use "preservim/tagbar"
end

local config = function()
  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register {
      ['<f8>'] = {'<cmd>TagbarToggle<cr>', 'Tagbar toggle'}
    }
    else
      vim.api.nvim_set_keymap('n', '<f8>', '<cmd>TagbarToggle<cr>', {})
  end
end

return {
  install = install,
  config = config,
}
