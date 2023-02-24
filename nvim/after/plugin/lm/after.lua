local custom = LM.config
if custom then
	-- config plugins
	for _, v in pairs(custom.plugin_list) do
		local ok, p = pcall(require, 'lm.plugins.' .. v)
		if ok then
			if p.post then
				p.post()
			end
		else
			print('Error loading plugin ' .. v)
		end
	end
end

local defaults = require 'lm.defaults'
local ok, _ = pcall(defaults.keymaps)
if not ok then
	vim.notify 'error loading keymaps'
end

if LM.config and LM.config.after then
	LM.config.after()
end
