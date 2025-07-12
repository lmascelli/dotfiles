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

return M
