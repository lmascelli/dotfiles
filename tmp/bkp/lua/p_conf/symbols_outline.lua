local packer = require 'packer'

local install = function()
  packer.use 'simrat39/symbols-outline.nvim'
end

local config = function()
  -- local symbols_outline = require 'symbols-outiline'
  vim.g.symbols_outline = {}
  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register {
      ["<leader>"] = { 
       ["<F8>"] = {"<cmd>SymbolsOutline<cr>", "outline"},
      },
    }
  else
  end
end

return {
  install = install,
  config = config,
}

