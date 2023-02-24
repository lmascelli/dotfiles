-------------------------------------------------------------------------------
-- global LM table
-------------------------------------------------------------------------------
local LM = {
  g = {
    opts = {},
    settings = {},
  },
  font = {
    font_name = '',
    font_size = 10,
  },
}

if vim.fn.has('win32') then
  LM.os_version = 'Windows'
elseif vim.fn.has('unix') then
  LM.os_version = 'Linux'
end

LM.dirs = {
  config = vim.fn.stdpath 'config',
  cache = vim.fn.stdpath 'cache',
  data = vim.fn.stdpath 'data',
}

return LM
