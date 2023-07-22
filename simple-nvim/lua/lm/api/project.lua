return {
  -- exec PROJECT.PS1 script
  project_ps1 = function()
    if (vim.fn.findfile('project.ps1') == 'project.ps1') then
      local action = vim.fn.input('arguments: ')
      local cmd = 'pwsh -Command ./project.ps1 ' .. action
      require('lm.api').exec_cmd(cmd)
      vim.cmd ':startinsert'
    else
      print 'project.ps1 script not found'
    end
  end,

  -- exec PROJECT.LUA script
  project_lua = function()
    if (vim.fn.findfile('project.lua') == 'project.lua') then
      vim.cmd ':source project.lua'
    else
      print 'project.lua script not found'
    end
  end,

  -- spawn an external terminal in current directory
  spawn_terminal = function()
    vim.fn.jobstart("wezterm-gui start --cwd .")
  end,

  eval_buffer = function()
    vim.cmd ':source %'
  end,
}
