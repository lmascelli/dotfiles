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
  vim.cmd(':terminal ' .. cmd)
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

-- open configuration directory
LM.edit_conf_dir = function(open_explorer)
  vim.fn.chdir(LM.dirs.config)
  if open_explorer then
    LM.explorer.toggle_explorer()
  end
end

-- open current configuration file
LM.edit_conf_file = function ()
  vim.fn.execute('e ' .. LM.dirs.config .. '/config.lua', "")
end

-- spawn an external terminal in current directory
LM.spawn_terminal = function()
  vim.fn.jobstart("wezterm-gui start --cwd .")
end

LM.eval_buffer = function()
  vim.cmd ':source %'
end
