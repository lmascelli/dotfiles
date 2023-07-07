LM.comments.template = {
  '/*******************************************************************************',
  '* ',
  '*******************************************************************************/',
}

vim.api.nvim_create_autocmd("BufEnter", {
  group = "Doxygen",
  pattern = {"*.cpp", "*.hpp", "*.h", "*.c"},
  callback = function(_)
    vim.cmd 'setlocal ft=cpp.doxygen'
  end
  })
