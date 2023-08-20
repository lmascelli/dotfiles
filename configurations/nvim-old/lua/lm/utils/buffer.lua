LM.api.toggle_colorcolumn = function()
  if not LM.options.settings.colorcolumn then
    LM.options.settings.colorcolumn = true
    vim.o.colorcolumn = tostring(LM.options.settings.colorcolumn_number)
  else
    LM.options.settings.colorcolumn = false
    vim.o.colorcolumn = tostring(0)
  end
end

LM.api.toggle_linenumber = function()
  if vim.opt.number._value == true then
    vim.opt.number = false
    vim.opt.relativenumber = false
  else
    vim.opt.number = true
    if LM.options.opts.relativenumber then
       vim.opt.relativenumber = true
    end
  end
end

LM.api.buffer_format = function()
  local curpos = vim.fn.getcurpos()
  vim.api.nvim_feedkeys('gg=G', 'n', false)
  for k, v in ipairs(curpos) do print(k, v) end
  vim.fn.cursor(curpos[2], curpos[3])
end

LM.api.buffer_delete = function()
  local count = 0
  for _, v in pairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(v) == 1 then
      count = count + 1
    end
  end
  if count == 1 then
    vim.api.nvim_create_buf(true, true)
  end
  pcall(vim.cmd, 'bprevious!')
  pcall(vim.cmd, 'bdelete!#')
end

LM.api.buffer_list = function()
  vim.cmd 'ls'
end

LM.api.count_char_to_column = function(end_column)
  column = end_column or 80
  return column - vim.fn.getpos('.')[3]
end
