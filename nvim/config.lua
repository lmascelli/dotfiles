local config = {}

config.colorscheme = 'slate'
if LM.os_version == 'Linux' then
   config.font_name = 'JetBrains Mono NF'
elseif LM.os_version == "Windows" then
   config.font_name = 'JetBrains Mono'
end
   
config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
}

config.load_plugins = true

config.plugin_list = {
  'which-key',
  -- 'nvim-tree',
  'telescope',
  -- 'lualine',
  -- 'bufferline',
  'lsp',
  -- 'lspsaga',
  -- 'nvim-cmp',
  -- 'luasnip',
  -- 'comment',
  -- 'nvim-autopairs',
  -- 'toggleterm',
  -- 'bufdelete',
  -- 'treesitter',
  -- 'startup-time',
  -- 'black',
}


config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
