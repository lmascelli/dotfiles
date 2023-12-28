local font_name = LM.font.font_name or ''
local font_size = LM.font.font_size or 10
vim.g.neovide_remember_window_size = false
vim.g.neovide_remember_window_position = false

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

vim.keymap.set('n', '<leader>a+', '<cmd>lua LM.api.appearence.increase_scale()<cr>', { desc = 'Increase font' })
vim.keymap.set('n', '<leader>a-', '<cmd>lua LM.api.appearence.decrease_scale()<cr>', { desc = 'Decrease font' })
