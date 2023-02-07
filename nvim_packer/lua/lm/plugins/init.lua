local plugins = {
  manager = nil,
  install = nil,
  config = nil,
}

local packer = require 'lm.plugins.packer'
plugins.manager = packer.check_load()
plugins.install = packer.install_plugin
plugins.config = packer.config_plugin
return plugins
