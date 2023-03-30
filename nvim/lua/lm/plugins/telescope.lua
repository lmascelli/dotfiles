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
		keymap_f('n', '<leader>sc', '<cmd>Telescope<cr>', {}, nil, 'list possible searches')
		keymap_f('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', {}, nil, 'find in files')
		keymap_f('n', '<leader>sf', '<cmd>Telescope find_files noignore=true hiddent=false<cr>', {}, nil, 'find files')
		keymap_f('n', '<leader>sb', '<cmd>Telescope buffers<cr>', {}, nil, 'list searches')
		keymap_f('n', '<leader>sz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {}, nil, 'find in buffer')
	end
end
return M
