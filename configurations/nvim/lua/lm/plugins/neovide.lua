local font_name = LM.font.font_name or ''
local font_size = LM.font.font_size or 10
vim.g.neovide_remember_window_size = false
vim.g.neovide_remember_window_position = false
vim.g.neovide_refresh_rate = 30
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_scroll_animation_far_lines = 1

local update_font = function()
  local ufont = font_name:gsub(' ', '\\ ')
  vim.cmd(':set guifont=' .. ufont .. ':h' .. font_size)
end

LM.api.appearence.increase_scale = function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.15
end

LM.api.appearence.decrease_scale = function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.15
end

update_font()

vim.keymap.set('n', '<leader>+', '<cmd>lua LM.api.appearence.increase_scale()<cr>', { desc = 'Increase font' })
vim.keymap.set('n', '<leader>-', '<cmd>lua LM.api.appearence.decrease_scale()<cr>', { desc = 'Decrease font' })
vim.keymap.set('n', '<f11>', function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = 'decrease font' })
vim.keymap.set('n', '<f10>', function()
  vim.cmd [[
  set columns=135
  set lines=40
  ]]
end, { desc = 'decrease font' })
