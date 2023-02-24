return {
  setup = function(use)
    use 'windwp/nvim-autopairs'
  end,
  config = function()
    local npairs = require 'nvim-autopairs'
    npairs.setup {
      map_cr = true
    }
  end
}
