-- this provide some functionalities that may be needed by other
-- packages and must not depend on anything but nvim api
require 'lm.runtime'

-- check if there is a global custom config file that can hold
-- different configuration from system to system. if not create
-- a default one
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

-- check if there is a project level configuration file
-- for example you may want to enable lsp on some projects
-- but keep it disabled by default
LM.api.project.load_local_nvim()
vim.api.nvim_create_autocmd("DirChanged", {
  group = LM.augroups.chdir,
  callback = LM.api.project.load_local_nvim,
})

-- load base keybindings
require 'lm.keymaps'
-- call each function in the pre_plugins_load list
for i, f in ipairs(LM.callbacks.pre_plugins_load) do
  f()
end
-- load package manager TODO abstract the concept of package manager
require 'lm.lazy'
-- call each function in the post_plugins_load list
for i, f in ipairs(LM.callbacks.post_plugins_load) do
  f()
end
-- load custom settings
require 'lm.set'
-- set apparence customizations
require 'lm.appearence'

-- various neovim gui's configs
if vim.g.neovide then
  require 'lm.plugins.neovide'
end

-- schedule a post_launch function that call each function in the post_load list
local function post_launch()
  for i, f in ipairs(LM.callbacks.post_launch) do
    f()
  end
end

vim.schedule(post_launch)
