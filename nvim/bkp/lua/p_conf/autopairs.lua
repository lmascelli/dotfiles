local packer = require 'packer'

local install = function()
  packer.use 'windwp/nvim-autopairs'
end

local config = function()
  local npairs = require 'nvim-autopairs'
  npairs.setup {
    map_cr = true
  }
end

return {
  install = install,
  config = config,
}

