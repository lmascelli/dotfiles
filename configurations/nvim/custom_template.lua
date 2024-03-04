LM.appearence.colorscheme = 'lunaperche'

LM.font.font_name = 'Cascadia Code'
LM.font.font_size = '10'
vim.opt.linespace = 0
LM.appearence.lines = 40
LM.appearence.columns = 110

vim.opt.makeprg = "pwsh -c "


--------------------------------------------------------------------------------
-- Make a plugins table

local with_coc = false
local with_lsp = true

local plugins_list = {
  'nvim-qt',
  'which_key',
  'telescope',
  'treesitter',
  'luasnip',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  'colorschemes',
  -- 'nvim-tree',
  'nvim-surround',
  'zen-mode',
  'tagbar',
  -- 'clangd',
  -- 'rust',
  'orgmode',
  -- 'pets',
  -- 'noice',
}

if with_lsp then
  table.insert(plugins_list, 'lsp')
  table.insert(plugins_list, 'nvim-cmp')
elseif with_coc then
  table.insert(plugins_list, 'coc')
end

for _, plugin in ipairs(plugins_list) do
  table.insert(LM.plugins.files_list, plugin)
end
