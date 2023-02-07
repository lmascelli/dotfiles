LM.explorer = {
  toggle_explorer = function()
    vim.cmd ':Lexplore'
  end,

  pushed_dir = vim.fn.getcwd(),

  push_dir = function()
    LM.pushed_dir = vim.fn.getcwd()
  end,

  pop_dir = function()
    vim.cmd('cd ' .. LM.pushed_dir)
  end,
}
