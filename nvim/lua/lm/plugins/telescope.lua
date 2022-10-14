return {
  setup = function(use)
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-symbols.nvim' },
      }
    }

  end,

  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
    if vim.g.lm['which-key-enabled'] then
      local wk = require 'which-key'
      wk.register {
        ['<leader>'] = {
          f = { '<cmd>Telescope find_files hidden=false<cr>', 'Find files' },
          t = {
            name = 'Telescope',
            f = { '<cmd>Telescope find_files hidden=true<cr>', 'Find in all files' },
            c = { '<cmd>Telescope commands<cr>', 'Find command' },
            s = { '<cmd>Telescope<cr>', 'List all finds' },
            g = { '<cmd>Telescope live_grep<cr>', 'Grep in current directory' },
          }
        }
      }
    else
      local keymap = vim.api.nvim_set_keymap -- <c-k> --> show Files (Ctrl+k)
      keymap('n', '<c-k>', '<cmd>Telescope find_files<cr>', {})
      -- <c-p> --> show Commands (Ctrl+p)
      keymap('n', '<leader>tc', '<cmd>Telescope commands<cr>', {
        silent = true,
        nowait = true,
      })
      keymap('n', '<leader>ts', '<cmd>Telescope<cr>', {})
      keymap('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', {})
      keymap('n', '<leader>tf', '<cmd>Telescope current_buffer_fuzzy_find<cr>', {})
    end
  end
}
