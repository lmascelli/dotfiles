return {
  setup = function(use)
    use 'famiu/bufdelete.nvim'
  end,
  config = function()
    if vim.g.lm['which-key-enabled'] then
      local wk = require 'which-key'
      wk.register({
        ['<leader>'] = {
          b = {
            d = { '<cmd>bdelete!<cr>', 'Delete' }, -- require famiu/bufdelete.nvim
          },
        },
      })
    end
  end
}
