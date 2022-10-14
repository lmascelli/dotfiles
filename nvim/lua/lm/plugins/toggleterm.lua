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
    if vim.g.lm['which-key-enabled'] then
    local wk = require 'which-key'
    wk.register {
      ["<leader>"] = {
        ["ò"] = {
          "<cmd>ToggleTerm<cr>", "ToggleTerm",
        }
      }
    }
    end
  end
}
