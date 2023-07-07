LM.custom = {
  config = nil,
  config_path = LM.dirs.config .. '/config.lua',
  load_custom = function()
    local ok, custom_config = pcall(dofile, LM.custom.config_path)

    if ok then
      return custom_config
    else
      -- copy the default configuration file
      vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/config.lua'),
        LM.custom.config_path)
      print 'custom config file copied.'
      return nil
    end
  end,
}

local ok, config = pcall(LM.custom.load_custom)
if ok then
  LM.custom.config = config
else
  print('error loading custom config')
end
