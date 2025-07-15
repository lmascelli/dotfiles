local M = {}

M.load_custom_file = function()
	-- check if there is a global custom config file that can hold
	-- different configuration from system to system. if not create
	-- a default one
	local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
	if vim.fn.filereadable(custom_file) ~= 0 then
		local res, _ = pcall(dofile, custom_file)
		if not res then
			vim.notify("ERROR loading custom.lua")
		end
	else
		vim.fn.writefile(
			vim.fn.readfile(vim.fn.stdpath('config') .. '/custom_template.lua'),
			vim.fn.stdpath('config') .. '/custom.lua'
		)
	end
end

M.toggle_theme = function()
  if vim.opt.background == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

-- open configuration directory
M.edit_conf_dir = function(open_explorer)
  vim.fn.chdir(vim.fn.stdpath 'config')
  if open_explorer then
    LM.fn.toggle_explorer()
  end
end

-- open custom.lua configuration file
M.edit_custom_config = function()
  local command = 'e ' .. vim.fn.stdpath('config') .. '/custom.lua'
  vim.cmd(command)
end

return M
