local packer = require 'packer'

local install = function()
        
  packer.use 'Mofiqul/vscode.nvim'
  packer.use 'morhetz/gruvbox'
end

local config = function()
  vim.g.current_colorscheme = 'gruvbox'
  vim.cmd (':colorscheme ' .. vim.g.current_colorscheme)

  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register {
      ["<leader>a"] = {
        name = "+Apparence",
        t = {"<cmd>:Telescope colorscheme<cr>", "choose theme"},
      }
    }
  end
end

return {
  install = install,
  config = config,
}
