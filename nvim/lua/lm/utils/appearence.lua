LM.toggle_colorcolumn = function()
  if not LM.g.settings.colorcolumn then
    LM.g.settings.colorcolumn = true
    vim.o.colorcolumn = tostring(LM.g.settings.colorcolumn_number)
  else
    LM.g.settings.colorcolumn = false
    vim.o.colorcolumn = tostring(0)
  end
end
