return {
  "https://github.com/preservim/tagbar",
  cmd = 'TagbarToggle',
  lazy = true,
  init = function()
    vim.keymap.set('n', '<leader><f8>', '<cmd>TagbarToggle<cr>', { desc = 'Toggle Tagbar' })
  end,
}
