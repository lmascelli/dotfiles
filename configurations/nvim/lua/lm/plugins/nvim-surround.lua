return {
  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end
  },
  -- nvim-surround training
  {
    "roobert/surround-ui.nvim",
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
