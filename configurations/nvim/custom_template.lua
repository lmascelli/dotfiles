LM.appearence.colorscheme = 'default'

LM.font.font_name = 'Cascadia Code'
LM.font.font_size = '10'

--------------------------------------------------------------------------------
-- Make a plugins table
local plugins_list = {
  'nvim-qt',
  'which_key',
  -- 'telescope',
  'treesitter',
  -- 'nvim-cmp',
  -- 'luasnip',
  -- 'lsp',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  'coc',
  'colorschemes',
  'nvim-tree',
  'nvim-surround',
  'zen-mode',
  'tagbar',
  -- 'clangd',
  -- 'rust',
  'orgmode',
  -- 'pets',
}

for _, plugin in ipairs(plugins_list) do
  table.insert(LM.plugins.files_list, plugin)
end
