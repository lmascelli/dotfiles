local packer = require 'packer'

local install = function()
  packer.use 'kyazdani42/nvim-tree.lua'
end

local config = function()
  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register {
      ['<leader>'] = {
          e = {'<cmd>NvimTreeToggle<cr>', 'Explorer'},
      }
    }
  else
    vim.api.nvim_set_keymap('n', '<leader>et', '<cmd>NvimTreeToggle<cr>', {})
    vim.api.nvim_set_keymap('n', '<leader>ef', '<cmd>NvimTreeFocus<cr>', {})
  end
  require 'nvim-tree'.setup {
    view = {
      mappings = {
        list = {
          {key = "cd", action = "cd"},
          {key = "cc", action = "copy"},
        }
      }
    }
  }
end

return {
  install = install,
  config = config,
}
