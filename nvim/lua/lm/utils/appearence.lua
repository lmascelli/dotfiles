LM.toggle_colorcolumn = function()
  if not LM.g.settings.colorcolumn then
    LM.g.settings.colorcolumn = true
    vim.o.colorcolumn = tostring(LM.g.settings.colorcolumn_number)
  else
    LM.g.settings.colorcolumn = false
    vim.o.colorcolumn = tostring(0)
  end
end

LM.toggle_linenumber = function()
  if vim.opt.number._value == true then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    if LM.g.opts.relativenumber then
       vim.opt.relativenumber = true
    end
  end
end
