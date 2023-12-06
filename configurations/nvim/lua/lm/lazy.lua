--------------------------------------------------------------------------------
-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
-- Make a plugins table
local active_plugins = {
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

LM.plugins = {}

for _, plugin in pairs(active_plugins) do
  local ok, p_table = pcall(require, 'lm.plugins.' .. plugin)
  if ok then
    table.insert(LM.plugins, p_table)
  else
    print('Problem loading the plugin table lm.plugins.' .. plugin)
  end
end

--------------------------------------------------------------------------------
-- Load the plugins table
require("lazy").setup(LM.plugins, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
  ui = {
    border = 'rounded',
  },
})
