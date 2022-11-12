LM.toggle_explorer = function()
  vim.cmd ':Lexplore'
end

LM.pushed_dir = vim.fn.getcwd()
LM.push_dir =  function()
  LM.pushed_dir = vim.fn.getcwd()
end
LM.pop_dir = function()
  vim.cmd('cd ' .. LM.pushed_dir)
end
