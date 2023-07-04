LM.comments = {
  template = "",
  insert = function()
    local cur_pos = vim.fn.getpos('.')[2]
    vim.fn.append(cur_pos - 1, LM.comments.template)
    vim.fn.cursor(cur_pos + 1, 3)
  end
}
