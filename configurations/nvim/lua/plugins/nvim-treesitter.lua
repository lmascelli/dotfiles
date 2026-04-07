return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = true,
  build = ":TSUpdate",
  event = {"BufRead"},
}
