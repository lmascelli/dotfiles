return {
  'nvim-orgmode/orgmode',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup {
      mappings = {
        prefix = '<C-c>',
      }
    }
  end
}
