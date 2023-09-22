LM.api.appearence = {
  load_theme = function ()
     local key = vim.api.nvim_replace_termcodes("<escape>:colorscheme ", true, false, true)
     vim.api.nvim_feedkeys(key, 'n', false)
  end
}
