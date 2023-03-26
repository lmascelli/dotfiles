local M = {}

M.name = 'nvim-comment'
M.url = 'numToStr/Comment.nvim'

M.config = function()
  local ok, comment = pcall(require, 'Comment')
  if ok then
    comment.setup {
    --    mappings = false
    }
  end
end

return M
