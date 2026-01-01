return {
  'nvim-orgmode/orgmode',
  enable = true,
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup()
  end,
}
