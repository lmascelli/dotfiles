LM.api.project = {
  -- exec PROJECT.PS1 script
  project_ps1 = function(in_buf)
    if (vim.fn.findfile('project.ps1') == 'project.ps1') then
      local action = vim.fn.input('arguments: ')
      if not in_buf then
        local cmd = 'pwsh -Command ./project.ps1 ' .. action
        vim.fn.jobstart(cmd)
      else
        local cmd = 'pwsh -Command ./project.ps1 ' .. action
        LM.api.utils.exec_cmd(cmd)
        vim.cmd ':startinsert'
      end
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
    local job = nil
    -- check if wezterm path is set or it's in PATH
    if (LM.wezterm_path and vim.fn.executable(LM.wezterm_path)) then
      job = LM.wezterm_path .. ' start --cwd .'
      vim.loop.spawn(LM.wezterm_path, {
        args = { 'start', '--cwd', '.' }
      })
      return
    elseif vim.fn.executable('wezterm') ~= 0 then
      job = "wezterm-gui start --cwd ."
    else
      -- use the set terminal or the default for the current OS
      if (LM.spawn_cmd and vim.fn.executable(LM.spawn_cmd) ~= 0) then
        job = LM.spawn_cmd
      else
        -- windows case
        if vim.fn.has('win32') then
          if vim.fn.executable('pwsh') ~= 0 then
            job = 'pwsh -c Start-Process pwsh'
          else
            job = 'powershell -c Start-Process pwsh'
          end
        else
          -- unix case
          if vim.fn.executable('xterm') ~= 0 then
            job = 'xterm'
          end
        end
      end
      if job then
        print(job)
        vim.fn.jobstart(job)
      end
    end
  end,

  eval_buffer = function()
    vim.cmd ':source %'
  end,
}
