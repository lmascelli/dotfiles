local custom = LM.config
if custom then
  -- config plugins
  for _, v in pairs(custom.plugin_list) do
    local ok, _ = pcall(LM.plugins.config, v)
    if not ok then
      print ('Error loading plugin ' .. v)
    end
  end
end

local ok, _ = pcall (require, 'lm.defaults')
