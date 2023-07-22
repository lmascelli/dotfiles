lua << EOF
pcall(vim.cmd, 'GuiLoad')
vim.api.nvim_set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})

if vim.fn.exists(':GuiFont') then
  local font_name = 'Monospace'
  local font_size = 10

  local update_font = function()
    vim.cmd(':GuiFont! ' .. font_name .. ':h' .. font_size)
  end

  local increase_font = function()
    font_size = font_size * 1.1
    update_font()
  end

  local decrease_font = function()
    font_size = font_size / 1.1
    update_font()
  end

  vim.keymap.set('n', '<leader>+', function() increase_font() end, {desc = 'Increase font'})
  vim.keymap.set('n', '<leader>-', function() decrease_font() end, {desc = 'Decrease font'})
end
EOF
