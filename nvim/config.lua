local config = {}

config.colorscheme = 'slate'
if LM.os == 'Linux' then
  config.font_name = 'Monospace'
  -- config.font_name = 'JetBrains Mono NF'
elseif LM.os == "Windows" then
  config.font_name = 'JetBrainsMono NFM'
end

config.font_size = 9

config.opts = {
  relativenumber = true,
  termguicolors = true,
}

config.settings = {
  colorcolumn = 80,
  global_statusline = true,
}

config.plugin_manager = 'lazy'

config.load_plugins = true

config.plugin_list = {
  'nvim-qt',
  'which-key',
  'nvim-tree',
  'telescope',
  'comment',
  'zen-mode',
  -- 'lualine',
  -- 'bufferline',
  'mason',
  'lsp',
  'nvim-cmp',
  'luasnip',
  'nvim-autopairs',
  -- 'org',
  -- 'coc',
  -- 'lspsaga',
  -- 'toggleterm',
  -- 'bufdelete',
  -- 'treesitter',
  -- 'startup-time',
  -- 'black',
  -- 'tagbar',
}

-- List of modes for which enable the lsp and snippets features
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
