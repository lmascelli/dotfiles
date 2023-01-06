return {
  setup = function(use)
    use {
      'akinsho/toggleterm.nvim',
      opt = true,
      cmd = "ToggleTerm",
      config = function()
        local shell = 'pwsh'
        require 'toggleterm'.setup {
          direction = 'float',
          float_opts = { border = 'curved' },
          shell = shell,
        }
      end
    }
    LM.keymap.set_keymap('n', '<leader>ò', '<cmd>ToggleTerm<cr>',
      { silent = true, noremap = true }, nil, 'terminal')
  end,

  config = function()
  end
}
