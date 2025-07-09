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


for _, plugin in pairs(LM.plugins.files_list) do
  local ok, p_table = pcall(require, 'lm.plugins.' .. plugin)
  if ok then
    table.insert(LM.plugins.table, p_table)
  else
    print('Problem loading the plugin table lm.plugins.' .. plugin)
  end
end

--------------------------------------------------------------------------------
-- Load the plugins table
require("lazy").setup(LM.plugins.table, {
  lockfile = vim.fn.stdpath('data') .. '/lazy-lock.json',
  ui = {
    border = 'rounded',
  },
})
