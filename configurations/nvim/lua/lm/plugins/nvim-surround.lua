return {
  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = '*',
    event = 'InsertEnter',
    config = function()
      require('nvim-surround').setup {}
    end
  },
  -- nvim-surround training
  {
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
  }
}
