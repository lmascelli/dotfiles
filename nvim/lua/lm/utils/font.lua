LM.font = {
  font_name = '',
  font_size = 10,
}

LM.font.load_custom = function()
  local custom = LM.config
  if custom and custom.font_size then
    LM.font.font_size = custom.font_size
  end
  if custom and custom.font_name then
    LM.font.font_name = custom.font_name
  end
end

LM.font.update_font = function()
  vim.opt.guifont = LM.font.font_name .. ':h' .. LM.font.font_size
end

LM.font.increase_font_size = function()
  LM.font.font_size = LM.font.font_size * 1.3
  LM.font.update_font()
end

LM.font.decrease_font_size = function()
  LM.font.font_size = LM.font.font_size / 1.3
  LM.font.update_font()
end

LM.font.update_font()
