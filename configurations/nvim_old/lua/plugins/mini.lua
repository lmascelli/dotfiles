return {
  'echasnovski/mini.nvim',
  version = '*',
  enabled = true,
  config = function() 
    require('mini.fuzzy').setup()
    require('mini.notify').setup()
    require('mini.icons').setup()

    require('mini.completion').setup()
    
    require('mini.pick').setup() 
    vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter'}, {
      group = LM.augroups.colorscheme,
      callback = function()
        vim.cmd "hi! link MiniPickNormal Pmenu"
        vim.cmd "hi! link MiniPickMatchCurrent PmenuSel"
      end,
    })
    vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, {desc = 'find file'})
    vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, {desc = 'find buffer'})

    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = 'n', keys = '<Leader>b', desc = '+Buffers' },
        { mode = 'n', keys = '<Leader>f', desc = '+Find' },
        { mode = 'n', keys = '<Leader>p', desc = '+Project' },
        { mode = 'n', keys = '<Leader>q', desc = '+Quit' },
      },
      window = {
        config = {
          width = 'auto'
        }
      },
    })
  end
}
