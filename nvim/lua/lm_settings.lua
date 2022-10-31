return {
  colorscheme = 'default',
  font_name = 'FiraCode NF',
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
    'bufdelete',
    'treesitter'
  },


  lsp_list = {
    'lua',
    'clangd',
    'pyright',
    'rust_analyzer',
    'powershell',
  },

  after = function()
    if vim.g.lm['which-key-enabled'] then
      vim.cmd 'hi WhichKeyFloat ctermbg=Black ctermfg=Black guibg=Black guifg=White'
    end
    vim.cmd 'hi Pmenu ctermbg=Black ctermfg=White guibg=Black guifg=White'
  end
}
