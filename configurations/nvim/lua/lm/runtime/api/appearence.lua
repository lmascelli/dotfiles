LM.api.appearence = {
  load_theme = function()
    local key = vim.api.nvim_replace_termcodes("<escape>:colorscheme ", true, false, true)
    vim.api.nvim_feedkeys(key, 'n', false)
  end,

  -- toggle the colorcolumn at line 80
  toggle_colorcolumn = function()
    -- TODO correct the toggle off
    if vim.opt.colorcolumn ~= '80' then
      vim.opt.colorcolumn = tostring(80)
    else
      vim.opt.colorcolumn = tostring()
    end
  end,

  toggle_transparency = function()
    if LM.appearence.transparency then
      vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
      LM.appearence.transparency = false
    else
      vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
      vim.cmd 'hi EndOfBuffer guibg=NONE ctermbg=NONE'
      LM.appearence.transparency = true
    end
  end
}
