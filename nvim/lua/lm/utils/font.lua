local current_settings = require 'lm_settings'
local append = vim.g.lm['append']

if current_settings.font_size then
  append("font_size", current_settings.font_size)
else
  append("font_size", 10)
end

if current_settings.font_name then
  append("font_name", current_settings.font_name)
else
  append("font_name", '')
end

append("update_font", function ()
  vim.opt.guifont = vim.g.lm.font_name .. ':h' .. vim.g.lm.font_size
end)

append("increase_font_size", function ()
  append('font_size', vim.g.lm.font_size + 1)
  vim.g.lm.update_font()
end)

append("decrease_font_size", function ()
  append('font_size', vim.g.lm['font_size'] - 1)
  vim.g.lm['update_font']()
end)

vim.g.lm.update_font()
