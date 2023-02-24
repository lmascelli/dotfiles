return {
  setup = function(use)
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-symbols.nvim' },
      },
      opt = true,
      event = "VimEnter",
      config = function()
        local ok, telescope = pcall(require, 'telescope')
        if ok then
          telescope.setup {
            pickers = {
              find_files = {
                hidden = true,
              },
            },
          }
          local keymap = LM.keymap.set_keymap
          keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', {}, nil, 'find files')
          keymap('n', '<leader>t', '', {}, nil, 'Telescope')
          keymap('n', '<leader>tc', '<cmd>Telescope commands<cr>', {
            silent = true,
            nowait = true,
          }, nil, 'commands')
          keymap('n', '<leader>ts', '<cmd>Telescope<cr>', {}, nil, 'list searches')
          keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {}, nil, 'find in files')
          keymap('n', '<leader>tf', '<cmd>Telescope find_files noignore=true hiddent=true<cr>', {}, nil, 'find files')
          keymap('n', '<leader>tz', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {}, nil, 'find in buffer')
        end
      end
    }

  end,

  config = function()
  end
}
