return {
  toggle_colorcolumn = function()
    if vim.opt.colorcolumn == '0' then
      vim.opt.colorcolumn = tostring(LM.colorcolumn_number)
    else
      vim.opt.colorcolumn = tostring()
    end
  end
}
