lua << EOF
pcall(vim.cmd, 'GuiLoad')
vim.api.nvim_set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})

local font_name = 'Cascadia Code'
local font_size = 10

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

  vim.keymap.set('n', '<leader>+', function() increase_font() end, {desc = 'Increase font'})
  vim.keymap.set('n', '<leader>-', function() decrease_font() end, {desc = 'Decrease font'})
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


if vim.g.neovide then
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_remember_window_position = false

  local update_font = function()
    local ufont = font_name:gsub(' ', '\\ ')
    vim.cmd(':set guifont=' .. ufont .. ':h' .. font_size)
  end

  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      LM.api.appearence.increase_scale = function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.15
      end
  
      LM.api.appearence.decrease_scale = function()
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.15
      end
  
      vim.keymap.set('n', '<leader>a+', '<cmd>lua LM.api.appearence.increase_scale()<cr>', {desc = 'Increase font'})
      vim.keymap.set('n', '<leader>a-', '<cmd>lua LM.api.appearence.decrease_scale()<cr>', {desc = 'Decrease font'})
    end
  })

  update_font()
end
EOF
