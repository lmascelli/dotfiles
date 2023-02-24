local plugins = {
  manager = nil,
  install = nil,
  config = nil,
}

local lazy = require 'lm.plugins.lazy'

plugins.manager = lazy.check_load()

if plugins.manager then
   plugins.install = lazy.install_plugin
else
   vim.notify("error loading package manager")
   return nil
end

return plugins
