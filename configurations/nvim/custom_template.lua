LM.appearence.colorscheme = 'lunaperche'

LM.font.font_name = 'Cascadia Code'
LM.font.font_size = '10'
vim.opt.linespace = 0
LM.appearence.lines = 40
LM.appearence.columns = 110
LM.api.completion.complete = LM.api.completion.custom_complete
LM.buffer.c_style_separator = false

vim.opt.makeprg = "pwsh -c "


--------------------------------------------------------------------------------
-- Make a plugins table

LM.plugins.with_coc = false
LM.plugins.with_lsp = true

local plugins_list = {
  -- 'nvim-qt',
  'colorschemes',
  'tagbar',
  'nvim-cmp',
  'luasnip',
  'nvim-surround',
  -- 'which_key',
  -- 'treesitter',
  -- 'telescope',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  -- 'nvim-tree',
  -- 'zen-mode',
  -- 'pets',
  -- 'noice',
  -- 'clangd',
  -- 'rust',
  'orgmode',
}

if with_lsp then
  table.insert(plugins_list, 'lsp')
elseif with_coc then
  table.insert(plugins_list, 'coc')
end

for _, plugin in ipairs(plugins_list) do
  table.insert(LM.plugins.files_list, plugin)
end
