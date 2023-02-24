return {
  setup = function(use)
    use 'numToStr/Comment.nvim'
  end,

  config = function()
    local comment = require 'Comment'
    comment.setup {
      --    mappings = false
    }
  end,
}
