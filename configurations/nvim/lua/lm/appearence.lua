-- italic comments
-- nice windows separator
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "Colorscheme",
  callback = function()
    if vim.g.colors_name == "default" or vim.g.colors_name == "zaibatsu" then
      if vim.fn.has("nvim-0.9") == 1 then
        vim.cmd 'hi! link Pmenu Title'
        vim.cmd 'hi! link SignColumn Normal'
      end
    end
    vim.opt.termguicolors = true
    vim.cmd "highlight Comment cterm=italic gui=italic"
    vim.cmd "highlight WinSeparator guibg=None"
    vim.cmd 'highlight CursorLine gui=underline'
    -- vim.cmd 'highlight! link CursorLine Underlined'
    -- tweaking default colorscheme
  end,
})

if LM.appearence.colorscheme then
  vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
end
