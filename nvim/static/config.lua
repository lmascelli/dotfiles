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
  -- 'nvim-autopairs',
  -- 'comment',
  -- 'which-key',
  -- 'telescope',
  -- 'treesitter',
  -- 'nvim-qt',
  -- 'nvim-tree',
  -- 'lualine',
  -- 'bufferline',
  -- 'zen-mode',
  -- 'lsp',
  -- 'mason',
  -- 'nvim-cmp',
  -- 'luasnip',
  -- 'coc',
  -- 'lspsaga',
  -- 'toggleterm',
  -- 'bufdelete',
  -- 'startup-time',
  -- 'black',
  -- 'tagbar',
  -- 'org',
}

-- -- Quick plugins with LSP
-- config.plugin_list = {
--   'nvim-autopairs',
--   'comment',
--   'which-key',
--   'telescope',
--   'treesitter',
--   'nvim-tree',
--   'lsp',
--   'mason',
--   'nvim-cmp',
--   'luasnip',
--   -- 'lspsaga',
-- }

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
