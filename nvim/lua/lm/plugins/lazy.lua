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
	local opts = plugin.opts
	LM.plugins.manager.setup({
	      plugin.url,
	      lazy = opts.lazy,
	      config = function(p)
		 opts.config()
	      end,
	})
end

return M
