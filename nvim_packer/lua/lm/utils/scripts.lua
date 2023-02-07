LM.exec_cmd = function(cmd)
  local buf = vim.api.nvim_create_buf(false, false)
  local margin = 0.1
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * (1 - 2 * margin)),
    height = math.floor(vim.o.lines * (1 - 2 * margin)),
    row = math.floor(vim.o.lines * margin),
    col = math.floor(vim.o.columns * margin),
  })
  vim.cmd (':terminal ' .. cmd)
end

-- exec PROJECT.PS1 script
LM.project_ps1 = function()
  if (vim.fn.findfile('project.ps1') == 'project.ps1') then
    local action = vim.fn.input('arguments: ')
    local cmd = 'pwsh -Command ./project.ps1 ' .. action
    LM.exec_cmd(cmd)
    vim.cmd ':startinsert'
  else
    print 'project.ps1 script not found'
  end
end

-- exec PROJECT.LUA script
LM.project_lua = function()
  if (vim.fn.findfile('project.lua') == 'project.lua') then
    vim.cmd ':source project.lua'
  else
    print 'project.ps1 script not found'
  end
end

LM.edit_conf = function()
  LM.push_dir()
  vim.cmd('cd ' .. vim.fn.stdpath('config'))
  vim.cmd 'e .'
end
