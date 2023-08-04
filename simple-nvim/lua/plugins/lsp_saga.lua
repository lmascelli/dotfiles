return {
  'nvimdev/lspsaga.nvim',
  event = 'VeryLazy',
  config = function()
    require('lspsaga').setup({})
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',   -- optional
    'nvim-tree/nvim-web-devicons',       -- optional
  }
}
