local M = {}

M.name = "mason"

M.url = "williamboman/mason.nvim"

M.cmd = "Mason"

M.config = function()
	local ok_mason, mason = pcall(require, 'mason')

	if ok_mason then
		mason.setup()
  else
    print 'error configuring mason'
  end
end

M.init = function()
  LM.keymaps.add_map('n', '<leader>lM', '<cmd>Mason<cr>', nil, nil, 'Mason')
end

return M
