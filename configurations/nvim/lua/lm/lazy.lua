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
  -- 'lsp_zero',
  'nvim-cmp',
  'lsp',
  --  'lsp_saga',
  'nvim_qt',
  -- 'nvim-autopairs',
  -- 'nvim-comment',
  'nvim-tree',
  'nvim-surround',
  'zen-mode',
  'telescope',
  'treesitter',
  'which_key',
  'clangd',
  'orgmode',
  -- 'rust',
}

local plugins = {}

for _, plugin in pairs(active_plugins) do
  local ok, p_table = pcall(require, 'lm.plugins.' .. plugin)
  if ok then
    table.insert(plugins, p_table)
  else
    print('Problem loading the plugin table lm.plugins.' .. plugin)
  end
end

--------------------------------------------------------------------------------
-- Load the plugins table
require("lazy").setup(plugins, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
})
