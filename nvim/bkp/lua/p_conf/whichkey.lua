local packer = require 'packer'

local install = function()
  packer.use {
  "folke/which-key.nvim",
}
end

local config = function()
  require 'which-key'.setup {
    window = {
      border = "double",
      margin = {1, 0, 1, 0},
      padding = {2, 2, 2, 2},
    },
    layout = {
      height = {min = 4, max = 25},
      width = {min = 20, max = 50},
      spacing = 5,
      align = "left",
    },
    show_help = true,
  }
  vim.g.whichkey = true
  vim.opt.timeoutlen = 500
end

return {
  install = install,
  config = config,
}
