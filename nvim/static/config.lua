local config = {}

config.colorscheme = 'default'
config.font_name = 'FiraCode NF'
config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
}

config.plugin_list = {
  'which-key',
  'nvim-tree',
  'telescope',
  'lualine',
  'bufferline',
  'lsp',
  'lspsaga',
  'nvim-cmp',
  'luasnip',
  'comment',
  'nvim-autopairs',
  'toggleterm',
  'bufdelete',
  'treesitter'
}


config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
