local font_name = LM.appearence.font.font_name or ''
local font_size = LM.appearence.font.font_size or 10
vim.g.neovide_remember_window_size = false
vim.g.neovide_remember_window_position = false
vim.g.neovide_refresh_rate = 30
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_cursor_animation_length = 0
-- vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_scroll_animation_far_lines = 1

vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

local update_font = function()
  local ufont = font_name:gsub(' ', '\\ ')
  vim.cmd(':set guifont=' .. ufont .. ':h' .. font_size)
end

LM.api.appearence.increase_scale = function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.15
  vim.api.nvim__redraw({ win = vim.api.nvim_get_current_win(), valid = false })
end

LM.api.appearence.decrease_scale = function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / 1.15
  vim.api.nvim__redraw({ win = vim.api.nvim_get_current_win(), valid = false })
end

LM.api.appearence.toggle_transparency = function()
  if LM.appearence.transparency then
    vim.g.neovide_transparency = 1.0
    LM.appearence.transparency = false
  else
    vim.g.neovide_transparency = 0.95
    LM.appearence.transparency = true
  end
end

pcall(update_font)

vim.keymap.set('n', '<leader>+', '<cmd>lua LM.api.appearence.increase_scale()<cr>', { desc = 'Increase font' })
vim.keymap.set('n', '<c-+>', '<cmd>lua LM.api.appearence.increase_scale()<cr>', { desc = 'Increase font' })
vim.keymap.set('n', '<leader>-', '<cmd>lua LM.api.appearence.decrease_scale()<cr>', { desc = 'Decrease font' })
vim.keymap.set('n', '<c-->', '<cmd>lua LM.api.appearence.decrease_scale()<cr>', { desc = 'Decrease font' })
vim.keymap.set('n', '<f11>', function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = 'decrease font' })
vim.keymap.set('n', '<f10>', LM.api.appearence.resize_window, { desc = '135x40' })
vim.keymap.set('n', '<leader>w<f2>', function()
  vim.cmd [[
  set columns=135
  set lines=40
  ]]
end, { desc = '90x40' })
vim.keymap.set('n', '<leader>w<f1>', function()
  vim.cmd [[
  set columns=90
  set lines=40
  ]]
end, { desc = '90x40' })
