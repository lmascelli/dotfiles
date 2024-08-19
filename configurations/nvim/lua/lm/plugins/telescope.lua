return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  lazy = true,
  cmd = "Telescope",
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'files' })
    vim.keymap.set('n', '<leader>bl', '<cmd>Telescope buffers<cr>', { desc = 'list buffers' })
    vim.keymap.set('n', '<C-p>', '<cmd>Telescope git_files<cr>', {})
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope grep_string<cr>', { desc = "grep" })

    LM.appearence.load_theme = function()
      vim.cmd 'Telescope colorscheme enable_preview=true<cr>'
    end
  end
}
