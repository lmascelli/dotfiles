-- italic comments
-- nice windows separator
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = LM.augroups.colorscheme,
  callback = function(_)
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
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  end,
})

if LM.appearence.colorscheme then
  vim.cmd('colorscheme ' .. LM.appearence.colorscheme)
end
