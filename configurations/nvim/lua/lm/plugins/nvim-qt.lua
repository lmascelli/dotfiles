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
    vim.api.nvim_set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})

    local font_name = LM.font.font_name or ''
    local font_size = LM.font.font_size or 10

    if vim.fn.exists(':GuiFont') ~= 0 then
      local update_font = function()
        vim.cmd(':GuiFont! ' .. font_name .. ':h' .. font_size)
      end

      local increase_font = function()
        font_size = font_size * 1.15
        update_font()
      end

      local decrease_font = function()
        font_size = font_size / 1.15
        update_font()
      end

      update_font()

      vim.keymap.set('n', '<leader>+', function() increase_font() end, { desc = 'Increase font' })
      vim.keymap.set('n', '<leader>-', function() decrease_font() end, { desc = 'Decrease font' })
    end

    if vim.fn.exists(':GuiWindowOpacity') ~= 0 then
      LM.api.appearence.toggle_transparency = function()
        if LM.appearence.transparency then
          vim.cmd 'GuiWindowOpacity 1'
          LM.appearence.transparency = false
        else
          vim.cmd 'GuiWindowOpacity 0.9'
          LM.appearence.transparency = true
        end
      end
    end
  end
}
