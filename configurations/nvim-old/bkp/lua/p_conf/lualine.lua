local packer = require 'packer'

local install = function()
    packer.use {
   'nvim-lualine/lualine.nvim',
   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end

local config = function()
		require 'lualine'.setup {
      options = {
        theme = 'auto',
--        theme = 'codedark',
      },
    }
end

return {
  install = install,
  config = config,
}
