local M = {}

M.check_load = function()
	local lazypath = LM.dirs.data .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
	local ok, lazy = pcall(require, 'lazy')
	if ok then
		return lazy
	else
		return nil
	end
end

M.install_plugin = function(plugin)
	local dependencies = {}
	if plugin.requires then
		for _, v in pairs(plugin.requires) do
			table.insert(dependencies, v.url)
		end
	end
	table.insert(LM.plugins.setup_list, {
		plugin.url,
		-- lazy = plugin.lazy,
		-- event = plugin.event,
		dependencies = dependencies,
    cmd = plugin.cmd,
    init = plugin.init,
		config = function(p)
			if plugin.config then
				plugin.config()
			end
		end,
	})
end

M.pre = function()
   LM.plugins.manager.setup(LM.plugins.setup_list)
end

return M
