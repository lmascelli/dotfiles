local current_settings = require 'lm_settings'

if current_settings.font_size then
  LM.font_size = current_settings.font_size
else
  LM.font_size = 10
end

if current_settings.font_name then
  LM.font_name = current_settings.font_name
else
  LM.font_name = ''
end

LM.update_font = function ()
  vim.opt.guifont = LM.font_name .. ':h' .. LM.font_size
end

LM.increase_font_size = function ()
  LM.font_size = LM.font_size + 1
  LM.update_font()
end

LM.decrease_font_size = function ()
  LM.font_size = LM.font_size - 1
  LM.update_font()
end

LM.update_font()
