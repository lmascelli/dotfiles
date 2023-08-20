LM.custom = {
  config = nil,
  config_path = LM.dirs.config .. '/config.lua',
  load_custom = function()
    local ok, custom_config = pcall(dofile, LM.custom.config_path)

    if ok then
      LM.custom.config = custom_config
    else
      -- copy the default configuration file
      vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/config.lua'),
        LM.custom.config_path)
      print 'custom config file copied.'
      LM.custom.config = nil
    end
  end,
}

LM.custom.load_custom()
