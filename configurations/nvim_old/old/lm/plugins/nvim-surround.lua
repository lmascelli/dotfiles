local M = {}

table.insert(M, {
  "kylechui/nvim-surround",
  version = '*',
  event = 'InsertEnter',
  config = function()
    require('nvim-surround').setup {}
  end
})

if LM.with_which_key then
  table.insert(M, {
    "roobert/surround-ui.nvim",
    event = 'BufRead',
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    config = function()
      require("surround-ui").setup({
        root_key = "S"
      })
    end,
  })
end

return M
