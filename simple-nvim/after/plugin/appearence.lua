-- italic comments
-- nice windows separator
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "Colorscheme",
  callback = function()
    vim.cmd "highlight Comment cterm=italic gui=italic"
    vim.cmd "highlight WinSeparator guibg=None"
  end,
})

LM.appearence = {
  colorscheme = 'slate',
  transparency = false,
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

vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
