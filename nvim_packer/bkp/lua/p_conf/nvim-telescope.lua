local packer = require 'packer'

local install = function()
  packer.use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-symbols.nvim' },
    }
  }
end

local config = function()
  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register {['<c-k>'] = {'<cmd>Telescope find_files<cr>', 'Find files'}}
    wk.register {
      ['<leader>'] = {
        t = {
          name = 'Telescope',
          c = {'<cmd>Telescope commands<cr>', 'Find command'},
          s = {'<cmd>Telescope<cr>', 'List all finds'},
          g = {'<cmd>Telescope live_grep<cr>', 'Grep in current directory'},
        }
      }
    }
  else
    local keymap = vim.api.nvim_set_keymap -- <c-k> --> show Files (Ctrl+k)
    keymap('n', '<c-k>', '<cmd>Telescope find_files<cr>', {})
    -- <c-p> --> show Commands (Ctrl+p)
    keymap('n', '<leader>tc', '<cmd>Telescope commands<cr>', {
      silent = true,
      nowait = true,
    })
    keymap('n', '<leader>ts', '<cmd>Telescope<cr>', {})
    keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {})
  end
end

return {
  install = install,
  config = config,
}
