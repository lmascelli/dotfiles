return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  config = function()
    local nvim_tree = require('nvim-tree')
    nvim_tree.setup {
      sync_root_with_cwd = true,
    }
  end,
  init = function()
    LM.api.toggle_explorer = function()
      vim.cmd ':NvimTreeToggle'
    end
  end
}

