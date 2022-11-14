local custom = LM.custom.load_custom()
if custom then
  -- config plugins
  for _, v in pairs(custom.plugin_list) do
    LM.plugins.config(v)
  end
end

require 'lm.defaults'
