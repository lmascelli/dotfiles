LM.appearence.colorscheme = 'gruvbox'

LM.font.font_name = 'Cascadia Code'
LM.font.font_size = '10'
vim.opt.linespace = 3

--------------------------------------------------------------------------------
-- Make a plugins table

local coc_list = false

local plugins_list_native = {
  'nvim-qt',
  'which_key',
  'telescope',
  'treesitter',
  'nvim-cmp',
  'luasnip',
  'lsp',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  -- 'coc',
  'colorschemes',
  'nvim-tree',
  'nvim-surround',
  'zen-mode',
  'tagbar',
  'clangd',
  -- 'rust',
  'orgmode',
  -- 'pets',
}

local plugins_list_coc = {
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
  -- 'nvim-tree',
  'nvim-surround',
  'zen-mode',
  'tagbar',
  -- 'clangd',
  -- 'rust',
  'orgmode',
  -- 'pets',
}

local plugins_list = plugins_list_native
if coc_list then
  plugins_list = plugins_list_coc
end

for _, plugin in ipairs(plugins_list) do
  table.insert(LM.plugins.files_list, plugin)
end
