vim.g.win = vim.loop.os_uname().version:match 'Windows'

if loaded_modules == nil then
  loaded_modules = {}
else
  print 'Reload init.lua'
  for k, _ in pairs(package.loaded) do
    for _, m in pairs(loaded_modules) do
      if string.match(k, m) then
        package.loaded[k] = nil
      end
    end
  end
end

local function load_module(mod)
  table.insert(loaded_modules, mod)
  return require(mod)
end

if not vim.g.vscode then
  load_module('plugins').setup {}
  load_module('keybinding')
end

load_module('basic')
load_module('utility')
load_module('filetypes')
if vim.g.neovide then
  load_module('neovide')
end
