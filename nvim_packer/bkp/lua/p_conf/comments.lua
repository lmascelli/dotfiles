local packer = require 'packer'

local install = function()
  packer.use 'numToStr/Comment.nvim'
end

local config = function()
  local comment = require 'Comment'
  comment.setup {
--    mappings = false
  }

  if vim.g.whichkey then
    local wk = require 'which-key'
    wk.register 
    {
      ['<leader>'] = {
        c = {
          name = '+Comment',
          l = {}, 
          b = {},
          o = {},
          O = {},
        }
      }
    }
  else

  end
end

return {
  install = install,
  config = config,
}

