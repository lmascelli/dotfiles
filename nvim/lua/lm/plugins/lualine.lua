local M = {}

M.name = 'lualine'
M.url = 'nvim-lualine/lualine.nvim'
M.lazy = false
M.requires = {
  {url = 'nvim-tree/nvim-web-devicons'},
}

M.config = function()
  require 'lualine'.setup {
    options = {
      theme = 'auto',
    },
  }
end

return M
