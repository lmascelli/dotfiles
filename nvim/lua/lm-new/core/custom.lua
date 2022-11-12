local M = {}
local custom_config_path = LM.dirs.config .. '/config.lua'

M.load_custom_config = function()
	local ok, custom_config = pcall(dofile, LM.dirs.config .. '/config.lua')
	if ok then
		return custom_config
	else
		return nil
	end
end

-- check if there is a custom config, otherwise copy the default one
if vim.fn.filereadable(custom_config_path) == 0 then
  -- copy the default configuration file
  vim.fn.writefile(vim.fn.readfile(LM.dirs.config .. '/static/config.lua'),
    custom_config_path)
    print 'Custom config file copied.'
    return nil
end

return M
