LM.plugins = {
  bootstrap = function()
    print 'No plugin manager '
  end,
  manager = nil,
  add_to_list = nil,
  config = nil,
  before = nil,
  add_template = nil,
  setup_list = {},
}

if LM.custom.config and LM.custom.config.plugin_manager then
  local ok, _ = pcall(require, 'lm.plugins.' .. LM.custom.config.plugin_manager)
  if not ok then
    print ('ERROR loading plugin manager: ' .. LM.custom.config.plugin_manager)
  end
else
  require 'lm.plugins.lazy'
end

LM.plugins.bootstrap()

LM.plugins.add_template = function(name)
  if name == nil then
    name = vim.fn.input("plugin name? ")
  end
  vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/plugin.lua'),
    LM.dirs.config .. '/lua/lm/plugins/' .. name .. '.lua')
  print ''
  print 'custom config file copied.'
end
