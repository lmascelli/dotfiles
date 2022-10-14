local append = vim.g.lm.append

append('format_func', function()
  vim.cmd 'gg=G'
end)
