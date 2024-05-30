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
        if vim.fn.has('win32') ~= 0 then
          if vim.fn.executable('pwsh') ~= 0 then
            job = 'pwsh -c Start-Process pwsh'
          else
            job = 'powershell -c Start-Process pwsh'
          end
        else
          -- unix case
          if vim.fn.executable('xterm') ~= 0 then
            job = 'xterm'
          elseif vim.fn.executable('konsole') ~= 0 then
            job = 'konsole'
          end
        end
      end
    end
    if job then
      print(job)
      vim.fn.jobstart(job)
    end
  end,

  eval_buffer = function()
    vim.cmd ':source %'
  end,

  -- check if there is a local configuration
  chech_local_nvim = function()
    local cwd = vim.fn.getcwd()
    local nvim_file = vim.fn.filereadable(cwd .. '/.project.lua')
    local dotnvim = vim.fn.isdirectory(cwd .. '/.nvim/pack/plugins/opt')

    return nvim_file ~= 0 and dotnvim ~= 0
  end,

  -- load the local nvim configuration
  load_local_nvim = function()
    if LM.api.project.chech_local_nvim() then
      vim.opt.packpath = vim.opt.packpath + -- add the .nvim local folder to manual plugins paths
          (vim.fn.getcwd() .. '/.project.lua')
      dofile(".project.lua")
    else
      vim.notify("no local configuration found", vim.log.levels.INFO)
    end
  end,

  -- create a local nvim configuration based on exrc .nvim.lua file
  init_local_nvim = function()
    -- check if the file structure exists
    local cwd = vim.fn.getcwd()
    local nvim_file = vim.fn.filereadable(cwd .. '/.project.lua')
    local dotnvim = vim.fn.isdirectory(cwd .. '/.nvim/pack/plugins/opt')
    if dotnvim == 0 then
      vim.fn.mkdir('.nvim/pack/plugins/opt', 'p')
    end
    if nvim_file == 0 then
      vim.fn.writefile({}, cwd .. '/.project.lua')
    end
    vim.cmd 'e .project.lua'
  end,

  -- install a plugin locally from git
  install_local_git_plugin = function()
    -- check if git is available
    if vim.fn.executable('git') == 0 then
      vim.notify('git is not available. install it first', vim.log.levels.ERROR)
      return
    end
    local pattern = '^https://github.com/[A-Za-z0-9_.-]+/([A-Za-z0-9_.-]+)$'
    local repo = vim.fn.input('repo url: ')
    local repo_name = string.match(repo, pattern)
    if repo_name ~= nil then
      local command = 'git clone ' .. repo .. ' .nvim/pack/plugins/opt/' .. repo_name
      vim.fn.jobstart(command, {
        on_exit = function()
          vim.notify(repo_name .. ' installed', vim.log.levels.INFO)
        end
      })
    else
      vim.notify('enter a valid url', vim.log.levels.ERROR)
      return
    end
  end
}
