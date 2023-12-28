require 'lm.runtime'
local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
if vim.fn.filereadable(custom_file) ~= 0 then
  local res, _ = pcall(dofile, custom_file)
  if not res then
    vim.notify("ERROR loading custom.lua")
  end
else
  vim.fn.writefile(vim.fn.readfile(vim.fn.stdpath('config') .. '/custom_template.lua'),
    vim.fn.stdpath('config') .. '/custom.lua')
end

require 'lm.keymaps'
require 'lm.lazy'
require 'lm.set'
require 'lm.appearence'

if vim.g.neovide then
  require 'lm.plugins.neovide'
end
