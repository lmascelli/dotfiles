return {
  setup = function (use)
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  end,
  config = function ()
		require 'lualine'.setup {
      options = {
        theme = 'auto',
      },
    }
  end,
}
