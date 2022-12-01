-------------------------------------------------------------------------------
-- gloabl LM table
-------------------------------------------------------------------------------
local LM = {
  g = {
    opts = {},
    settings = {},
  },
}

if vim.fn.has('unix') then
  LM.os_version = 'Linux'
elseif vim.fn.has('win32') then
  LM.os_version = 'Windows'
end

LM.dirs = {
  config = vim.fn.stdpath 'config',
  cache = vim.fn.stdpath 'cache',
  data = vim.fn.stdpath 'data',
}

return LM
