local M = {}

M.name = 'telescope'
M.url = 'nvim-telescope/telescope.nvim'
M.lazy = true
M.cmd = "Telescope"
M.requires = {
	{ url = 'nvim-lua/plenary.nvim' },
	{ url = 'nvim-telescope/telescope-symbols.nvim' },
}
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
	end
end
M.init = function()
		local keymap = LM.keymaps.add_map
		keymap('n', '<leader>sc', '<cmd>Telescope<cr>', {}, nil, 'list possible searches')
		keymap('n', '<leader>sg', '<cmd>Telescope live_grep<cr>', {}, nil, 'find in files')
		keymap('n', '<leader>sf', '<cmd>Telescope find_files noignore=false hiddent=false<cr>', {}, nil, 'find files')
		keymap('n', '<leader>sz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {}, nil, 'find in buffer')
		keymap('n', '<leader>bl', '<cmd>Telescope buffers<cr>', {}, nil, 'list buffer')

    LM.api.list_colorschemes = function()
      vim.cmd 'Telescope colorscheme enable_preview=true<cr>'
    end

    LM.api.find_file = function()
      vim.cmd 'Telescope find_files noiginore=true<cr>'
    end
end
return M