local function filetype_cmd(ftype, callback)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ftype,
    callback = function()
      vim.schedule(callback)
    end,
  })
end

require 'lm.filetypes.markdown'

filetype_cmd('python', function()
  require 'lm.filetypes.python'
end)

-- filetype_cmd('matlab', function()
--   require 'lm.filetypes.matlab'
-- end)
