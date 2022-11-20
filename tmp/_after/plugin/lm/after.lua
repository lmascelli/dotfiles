local custom = LM.custom.load_custom()
if custom then
  -- config plugins
  for _, v in pairs(custom.plugin_list) do
    pcall(LM.plugins.config, v)
  end
end

pcall (require, 'lm.defaults')
