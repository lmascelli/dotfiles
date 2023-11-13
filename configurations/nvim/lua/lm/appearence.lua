-- italic comments
-- nice windows separator
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "Colorscheme",
  callback = function()
    vim.cmd "highlight Comment cterm=italic gui=italic"
    vim.cmd "highlight WinSeparator guibg=None"
    -- tweaking default colorscheme
    if vim.g.colors_name == "default" then
      vim.cmd 'hi! link Pmenu Title'
      vim.cmd 'hi! link SignColumn Normal'
      vim.opt.termguicolors = false
    else
      vim.opt.termguicolors = true
    end
  end,
})

if LM.appearence.colorscheme then
  vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
end
