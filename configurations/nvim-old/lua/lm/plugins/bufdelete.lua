local M = {}

M.name = "bufdelete"
M.url = 'famiu/bufdelete.nvim'
M.config = function()
  LM.buffer_delete = function()
    vim.cmd 'Bdelete'
  end
end

return M
