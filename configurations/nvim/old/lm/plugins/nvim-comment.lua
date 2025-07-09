return {
  'numToStr/Comment.nvim',
  event = "InsertEnter",
  config = function()
    local comment = require('Comment')
    comment.setup {
      --    mappings = false
    }
  end,
}
