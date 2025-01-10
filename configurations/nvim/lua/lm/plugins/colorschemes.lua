return {
  -- {
  --   "folke/tokyonight.nvim",
  -- },
  -- {
  --   "catppuccin/nvim",
  -- },
  {
    'https://github.com/morhetz/gruvbox'
  },
  {
    "whizikxd/naysayer-colors.nvim",
    lazy = false,
    config = function()
      vim.cmd("colorscheme naysayer")
    end
  },
}
