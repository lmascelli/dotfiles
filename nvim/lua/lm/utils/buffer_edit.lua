local append = vim.g.lm.append

append('indent_buffer', function()
  local curpos = vim.fn.getcurpos()
  vim.api.nvim_feedkeys('gg=G', 'n', false)
  for k, v in ipairs(curpos) do print(k, v) end
  vim.fn.cursor(curpos[2], curpos[3])
end)

append('buffer_delete', function()
  vim.cmd 'bprevious'
  vim.cmd 'bdelete#'
end)
