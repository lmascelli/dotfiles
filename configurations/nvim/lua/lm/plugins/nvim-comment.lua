return {
  'numToStr/Comment.nvim',
  event = "BufRead",
  config = function()
    local comment = require('Comment')
    comment.setup {
      --    mappings = false
    }
  end,
}
