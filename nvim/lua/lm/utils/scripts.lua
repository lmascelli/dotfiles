local current_settings = require 'lm_settings'
local append = vim.g.lm['append']

append('exec_cmd', function(cmd)
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
end)

-- exec PROJECT.PS1 script
append('project_ps1', function()
  if (vim.fn.findfile('project.ps1') == 'project.ps1') then
    local action = vim.fn.input('arguments: ')
    local cmd = 'pwsh -Command ./project.ps1 ' .. action
    vim.g.lm['exec_cmd'](cmd)
    vim.cmd ':startinsert'
  else
    print 'project.ps1 script not found'
  end
end)

-- exec PROJECT.PS1 script
append('project_lua', function()
  if (vim.fn.findfile('project.lua') == 'project.lua') then
    vim.cmd ':source project.lua'
  else
    print 'project.ps1 script not found'
  end
end)

-- reload vimrc
append('reload_vimrc', function()
  vim.cmd ':so $MYVIMRC'
end)

append('edit_conf', function()
  vim.g.lm.push_dir()
  vim.cmd('cd ' .. vim.fn.stdpath('config'))
  vim.cmd 'e .'
end)
