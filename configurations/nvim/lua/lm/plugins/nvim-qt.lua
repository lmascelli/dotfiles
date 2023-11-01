vim.api.nvim_create_user_command('GuiLoad', function(args)
  print(args.name)
end, {
  })

return {
  "equalsraf/neovim-gui-shim",
  lazy = true,
  cmd = 'GuiLoad',
  config = function()
    vim.api.nvim_create_user_command('GuiLoad', function(args)
      print(args.name)
    end, {
      })
  end
}
