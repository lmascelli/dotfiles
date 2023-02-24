local config = {}

config.colorscheme = 'default'
if LM.os_version == 'Linux' then
   config.font_name = 'FiraCode Nerd Fonts'
elseif LM.os_version == "Windows" then
   config.font_name = 'FiraCode NF'
end
   
config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
}

config.load_plugins = false

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
  'treesitter',
  'startup-time',
  'black',
}


config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
