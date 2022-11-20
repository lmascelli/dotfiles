return {
  setup = function(use)
    use 'akinsho/toggleterm.nvim'
  end,

  config = function()
    local shell = 'pwsh'
    require 'toggleterm'.setup {
      direction = 'float',
      float_opts = { border = 'curved' },
      shell = shell,
    }
    LM.keymap.set_keymap('n', '<leader>ò', '<cmd>ToggleTerm<cr>',
      { silent = true, noremap = true }, nil, 'terminal')
  end
}
