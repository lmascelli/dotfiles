-------------------------------------------------------------------------------
-- global LM table
-------------------------------------------------------------------------------
LM = {
  dirs = {
    config = vim.fn.stdpath 'config',
    cache = vim.fn.stdpath 'cache',
    data = vim.fn.stdpath 'data',
  },
  api = {
  },
}

if vim.fn.has('win32') == 1 then
  LM.os = 'Windows'
elseif vim.fn.has('unix') == 1 then
  LM.os = 'Linux'
end
