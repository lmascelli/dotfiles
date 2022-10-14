local current_settings = require 'lm_settings'
local append = vim.g.lm['append']

-- exec PROJECT.PS1 script
append('project_ps1', function()
  if (vim.fn.findfile('project.ps1') == 'project.ps1') then
    local action = vim.fn.input('arguments: ')
    local cmd = 'pwsh -Command ./project.ps1 ' .. action
    vim.cmd (':terminal ' .. cmd)
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
append('reload_vimrc', function ()
    vim.cmd ':so $MYVIMRC'
end
)
