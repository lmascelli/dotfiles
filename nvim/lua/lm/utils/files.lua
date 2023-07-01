LM.api.find_file = function()
  find_file_keys = vim.api.nvim_replace_termcodes(
      '<esc>:find \t\b', true, false, true)
  vim.api.nvim_feedkeys(find_file_keys, 'n', false)
end
