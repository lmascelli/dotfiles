local plugins = {
  manager = nil,
  install = nil,
  config = nil,
  pre = nil,
  setup_list = {},
}

local lazy = require 'lm.plugins.lazy'

plugins.manager = lazy.check_load()

if plugins.manager then
   plugins.install = lazy.install_plugin
   plugins.pre = lazy.pre or function() end
else
   vim.notify("error loading package manager")
   return nil
end

return plugins
