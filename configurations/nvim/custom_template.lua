vim.g.gruvbox_contrast_dark = 'hard'
LM.appearence.colorscheme = 'lunaperche'

LM.appearence.font.font_name = 'Cascadia Code'
LM.appearence.font.font_size = '10'
vim.opt.linespace = 0
LM.appearence.lines = 40
LM.appearence.columns = 110
LM.api.completion.complete = LM.api.completion.custom_complete
LM.buffer.c_style_separator = false

vim.opt.makeprg = "pwsh -c "
vim.opt.shell = "pwsh"


--------------------------------------------------------------------------------
-- Make a plugins table

local plugins_list = {
  'colorschemes',
  'tagbar',
  'luasnip',
  'mini-nvim',
  -- 'lsp',
  -- 'nvim-qt',
  -- 'nvim-surround',
  -- 'which_key',
  -- 'treesitter',
  -- 'telescope',
  -- 'mason', -- enable also lsp for this
  -- 'nvim-cmp', -- this must follow lsp module if enabled
  -- 'coc',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  -- 'nvim-tree',
  -- 'zen-mode',
  -- 'pets',
  -- 'noice',
  ----------------------- languages related
  'orgmode',
  -- 'clangd',
  -- 'rust',
}

for _, plugin in ipairs(plugins_list) do
  table.insert(LM.plugins.files_list, plugin)
end

-- example of post launch function
table.insert(LM.callbacks.post_launch, function() end)
