local config = {}

config.colorscheme = 'default'
if LM.os == 'Linux' then
  config.font_name = 'JetBrains Mono NF'
elseif LM.os == "Windows" then
  config.font_name = 'JetBrains Mono'
end

config.font_size = 10

config.opts = {

}

config.settings = {
  colorcolumn = 80,
  global_statusline = true,
}

config.plugin_manager = 'lazy'

config.load_plugins = true

config.plugin_list = {
  -- 'nvim-qt',
  -- 'which-key',
  -- 'telescope',
  -- 'treesitter',
  -- 'nvim-tree',
  -- 'comment',
  -- 'lualine',
  -- 'bufferline',
  -- 'zen-mode',
  -- 'lsp',
  -- 'mason',
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
  -- 'org',
}

-- List of modes for which enable the lsp and snippets features
-- Disabled because now lsp is started manually
-- config.prog_modes = {
--   "python",
--   "c",
--   "cpp",
--   "lua",
--   "matlab",
-- }

config.lsp_list = {
  'lua',
  'clangd',
  'pyright',
  'rust_analyzer',
  'powershell',
}

return config
