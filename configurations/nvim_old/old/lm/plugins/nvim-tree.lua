return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'NvimTreeToggle',
  config = function()
    local nvim_tree = require('nvim-tree')
    nvim_tree.setup {
      sync_root_with_cwd = true,
    }
  end,
  init = function()
    LM.toggle_explorer = function()
      vim.cmd ':NvimTreeToggle'
    end
  end
}
