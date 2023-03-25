local M = {}

M.name = 'telescope'
M.url = 'nvim-telescope/telescope.nvim'
M.lazy = false
M.requires = {
	{ url = 'nvim-lua/plenary.nvim' },
	{ url = 'nvim-telescope/telescope-symbols.nvim' },
}
M.event = "VimEnter"
M.config = function(params)
  local ok, telescope = pcall(require, 'telescope')
	if ok then
		telescope.setup {
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		}
		local keymap_f = LM.keymaps.add_map
		keymap_f('n', '<leader>f', '<cmd>Telescope find_files<cr>', {}, nil, 'find files')
		keymap_f('n', '<leader>t', '', {}, nil, 'Telescope')
		keymap_f('n', '<leader>tc', '<cmd>Telescope commands<cr>', {
			silent = true,
			nowait = true,
		}, nil, 'commands')
		keymap_f('n', '<leader>ts', '<cmd>Telescope<cr>', {}, nil, 'list searches')
		keymap_f('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {}, nil, 'find in files')
		keymap_f('n', '<leader>tf', '<cmd>Telescope find_files noignore=true hiddent=true<cr>', {}, nil, 'find files')
		keymap_f('n', '<leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {}, nil, 'find in buffer')
	end
end
return M
