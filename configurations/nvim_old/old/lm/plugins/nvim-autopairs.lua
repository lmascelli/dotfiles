return {
  'windwp/nvim-autopairs',
  event = "VeryLazy",
  config = function()
    local npairs = require('nvim-autopairs')
    npairs.setup {
      map_cr = true,
    }
  end
}
