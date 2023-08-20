local config = LM.custom.config

if config then
	-- config plugins
	for _, v in pairs(config.plugin_list) do
		local ok, p = pcall(require, 'lm.plugins.' .. v)
		if ok then
			if p.post then p.post() end
		else
			print('after:post. Error loading plugin ' .. v)
		end
	end
end

-------------------------------------------------------------------------------
-- set keymaps
-------------------------------------------------------------------------------

for _, v in pairs(LM.keymaps.maps) do
  LM.keymaps.set_keymap(v.mode, v.map, v.expr, v.opts, v.buf, v.name)
end

if LM.custom.config and LM.custom.config.after then
	LM.custom.config.after()
end
