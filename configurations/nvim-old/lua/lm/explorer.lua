--------------------------------------------------------------------------------
--  USE NetRW as default file explorer
--------------------------------------------------------------------------------

-- set netrw options
vim.g.netrw_banner = false

LM.explorer = {
  toggle_explorer = function()
    vim.cmd ':20Lexplore'
  end,

  pushed_dir = vim.fn.getcwd(),

  push_dir = function()
    LM.pushed_dir = vim.fn.getcwd()
  end,

  pop_dir = function()
    vim.cmd('cd ' .. LM.pushed_dir)
  end,
}
