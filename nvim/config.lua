local config = {}

config.colorscheme = 'slate'
if LM.os_version == 'Linux' then
  config.font_name = 'JetBrains Mono NF'
elseif LM.os_version == "Windows" then
  config.font_name = 'JetBrains Mono'
end

config.font_size = 9

config.opts = {
  termguicolors = true,
}

config.settings = {
  colorcolumn = 80,
}

config.load_plugins = true

config.plugin_list = {
  'which-key',
  'nvim-tree',
  'telescope',
  -- 'lualine',
  'bufferline',
  'zen-mode',
  'lsp',
  'nvim-cmp',
  'luasnip',
  'nvim-autopairs',
  -- 'coc',
  -- 'lspsaga',
  'comment',
  'toggleterm',
  -- 'bufdelete',
  -- 'treesitter',
  -- 'startup-time',
  -- 'black',
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
