local function filetype_cmd(ftype, callback)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ftype,
    callback = callback,
  })
end

require 'lm.filetypes.markdown'
filetype_cmd('python', function()
  require 'lm.filetypes.python'
end)
