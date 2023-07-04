LM.comments = {
  template = "",
  insert = function()
    vim.fn.append(vim.fn.getpos('.')[2] - 1, LM.comments.template)
  end
}
