LM.plugins.bootstrap = function()
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
    LM.plugins.manager = lazy
	end
end

LM.plugins.add_to_list = function(plugin)
	local dependencies = {}
	if plugin.requires then
		for _, v in pairs(plugin.requires) do
			table.insert(dependencies, v.url)
		end
	end
  if table.getn(dependencies) == 0 then
    dependencies = nil
  end
	table.insert(LM.plugins.setup_list, {
		plugin.url,
    dit = plugin.dir,
		lazy = plugin.lazy,
    branch = plugin.branch,
		event = plugin.event,
		dependencies = dependencies,
    cmd = plugin.cmd,
    init = plugin.init,
    ft = plugin.ft,
    pin = plugin.held,
		config = function(p)
			if plugin.config then
				plugin.config()
			end
		end,
	})
end

LM.plugins.before = function()
   LM.keymaps.add_map('n', '<leader>cl', '<cmd>Lazy<cr>', nil, nil, 'Lazy')
   LM.plugins.manager.setup(LM.plugins.setup_list)
end
