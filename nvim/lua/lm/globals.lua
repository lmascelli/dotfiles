-------------------------------------------------------------------------------
-- global LM table
-------------------------------------------------------------------------------
LM = {
  dirs = {
    config = vim.fn.stdpath 'config',
    cache = vim.fn.stdpath 'cache',
    data = vim.fn.stdpath 'data',
  }
}

if vim.fn.has('win32') then
  LM.os = 'Windows'
elseif vim.fn.has('unix') then
  LM.os = 'Linux'
end
