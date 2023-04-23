local config = {}

config.colorscheme = 'default'
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
  -- 'which-key',
  -- 'telescope',
  -- 'treesitter',
  -- 'nvim-tree',
  -- 'comment',
  -- 'lualine',
  -- 'bufferline',
  -- 'zen-mode',
  -- 'lsp',
  -- 'nvim-cmp',
  -- 'luasnip',
  -- 'nvim-autopairs',
  -- 'coc',
  -- 'lspsaga',
  -- 'toggleterm',
  -- 'bufdelete',
  -- 'startup-time',
  -- 'black',
  -- 'tagbar',
}

-- List of modes for which enable the lsp and snippets features
config.prog_modes = {
  "python",
  "c",
  "cpp",
  "lua",
  "matlab",
}

config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
