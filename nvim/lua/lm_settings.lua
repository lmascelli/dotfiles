return {
  colorscheme = 'default',
  font_name = 'Fira Code',
  font_size = 10,



  plugin_list = {
    'which-key',
    'nvim-tree',
    'telescope',
    'lualine',
    'bufferline',
    'lsp',
    'nvim-cmp',
    'luasnip',
    'comment',
    'nvim-autopairs',
    'toggleterm',
    'colorschemes',
    'bufdelete',
  },


  lsp_list = {
    'lua',
    'cpp',
    'python',
    'rust',
    'powershell',
  },

  after = function()
    if vim.g.lm['which-key-enabled'] then
      vim.cmd 'hi WhichKeyFloat ctermbg=Black ctermfg=Black guibg=Black guifg=White'
    end
    vim.cmd 'hi Pmenu ctermbg=Black ctermfg=White guibg=Black guifg=White'
  end
}
