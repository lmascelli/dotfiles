vim.g.gruvbox_contrast_dark = 'hard'
LM.appearence.colorscheme = 'lunaperche'

LM.appearence.font.font_name = 'Cascadia Code'
LM.appearence.font.font_size = '10'
vim.opt.linespace = 0
LM.appearence.lines = 40
LM.appearence.columns = 110
LM.completion.complete = LM.completion.custom_complete
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
  -- 'nvim-cmp', -- this must follow the lsp module if enabled
  -- 'coc',
  -- 'lsp_zero',
  -- 'lsp_saga',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  -- 'nvim-tree',
  -- 'zen-mode',
  -- 'pets',
  -- 'noice',
  -- 'volt',
  -- 'astronvim',
  -- 'ivy',
  -- 'ido',
  -- 'slimv',
  -- 'multicursors',
  ----------------------- languages related
  'orgmode',
  -- 'wgsl',
  -- 'clangd',
  -- 'rust',
}

-- example of pre plugins load function
table.insert(LM.callbacks.pre_plugins_load, function()
  for _, plugin in ipairs(plugins_list) do
    table.insert(LM.plugins.files_list, plugin)
  end
end)

-- example of post plugins load function
table.insert(LM.callbacks.post_plugins_load, function()
  if LM.Mini then
    if vim.g.neovide == nil then
      LM.Mini.activate_animate()
    end
    LM.Mini.activate_completion()
    LM.Mini.activate_notify()
    LM.Mini.activate_files()
    LM.Mini.activate_pick()
    LM.Mini.activate_clue()
    vim.keymap.set('n', "<C-i>",
      function()
        MiniPick.builtin.grep_live()
      end, { desc = "FZF" })
    vim.keymap.set('n', "<C-p>",
      function()
        MiniPick.builtin.buffers()
      end, { desc = "FZF" })
  end
end)

-- example of post launch function
table.insert(LM.callbacks.post_launch, function()
  vim.g.neovide_remember_window_size = true
end)
