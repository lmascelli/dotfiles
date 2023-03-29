local M = {}
M.url = "neoclide/coc.nvim"
M.lazy = false
M.branch = "release"
M.init = function()
  LM.complete = function()
  end
end
return M
