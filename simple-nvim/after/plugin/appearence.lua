-- italic comments
-- nice windows separator
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "Colorscheme",
  callback = function()
    vim.cmd "highlight Comment cterm=italic gui=italic"
    vim.cmd "highlight WinSeparator guibg=None"
    if vim.g.colors_name == 'default' then
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#3B4252', fg = '#5E81AC' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#3B4252' })
      vim.api.nvim_set_hl(0, 'PMenu', { bg = '#3B4252', fg = '#5E81AC' })
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#3B4252' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#3B4252' })
    end
  end,
})

vim.cmd('colorscheme ' .. 'slate')
