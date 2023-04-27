local plugins = {
  manager = nil,
  add_to_list = nil,
  config = nil,
  pre = nil,
  add_template = nil,
  setup_list = {},
}

local lazy = require 'lm.plugins.lazy'

plugins.manager = lazy.check_load()

if plugins.manager then
  plugins.add_to_list = lazy.install_plugin
  plugins.pre = lazy.pre or function()
  end
else
  vim.notify("error loading package manager")
  return nil
end

plugins.add_template = function(name)
  if name == nil then
    name = vim.fn.input("plugin name? ")
  end
  vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/plugin.lua'),
    LM.dirs.config .. '/lua/lm/plugins/' .. name .. '.lua')
  print ''
  print 'custom config file copied.'
end

return plugins
