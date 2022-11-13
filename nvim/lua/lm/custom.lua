local custom = {}
custom.config_path = LM.dirs.config .. '/config.lua'

custom.load_custom = function()
	local ok, custom_config = pcall(dofile, custom.config_path)
	if ok then
		return custom_config
	else
  -- copy the default configuration file
  vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/config.lua'),
    custom.config_path)
    print 'custom config file copied.'
		return nil
	end
end

return custom
