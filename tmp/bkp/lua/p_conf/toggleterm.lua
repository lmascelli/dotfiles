local packer = require 'packer'

local install = function()
  packer.use 'akinsho/toggleterm.nvim'
end

local config = function()
  local shell = 'pwsh'
  require 'toggleterm'.setup {
    open_mapping = [[<leader>ò]],
    direction = 'float',
    float_opts = { border = 'curved' },
    shell = shell,
  }
  local wk = require 'which-key'
  wk.register {
    ["<leader>"] = {
      ["ò"] = {
        "<cmd>ToggleTerm<cr>", "ToggleTerm",
      }
    }
  }
end

return {
  install = install,
  config = config,
}
