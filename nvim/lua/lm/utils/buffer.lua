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
