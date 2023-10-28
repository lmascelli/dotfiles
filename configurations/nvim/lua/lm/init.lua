require 'lm.runtime'
local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
if vim.fn.filereadable(custom_file) ~= 0 then
  local res, _ = pcall(dofile, custom_file)
  if not res then
    vim.notify("ERROR loading custom.lua")
  end
end
require 'lm.keymaps'
require 'lm.lazy'
require 'lm.set'
