return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'files' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fg', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "grep" })
  end
}
