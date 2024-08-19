LM.completion = {
  complete = function()
    vim.opt.iskeyword:remove { '_' }
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
    vim.opt.iskeyword:append { '_' }
  end,

  trigger_omnicomplete = function()
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<C-x><C-o>', true, true, true), 'n', true)
  end,

  custom_complete = function()
    vim.cmd [[
    let old_keyword = &iskeyword
    set iskeyword+=_
    ]]
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n', true)
  end
}
