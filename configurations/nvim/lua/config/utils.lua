local M = {}

M.load_custom_file = function()
	-- check if there is a global custom config file that can hold
	-- different configuration from system to system. if not create
	-- a default one
	local custom_file = vim.fn.stdpath('config') .. '/custom.lua'
	if vim.fn.filereadable(custom_file) ~= 0 then
		local res, _ = pcall(dofile, custom_file)
		if not res then
			vim.notify("ERROR loading custom.lua")
		end
	else
		vim.fn.writefile(
			vim.fn.readfile(vim.fn.stdpath('config') .. '/custom_template.lua'),
			vim.fn.stdpath('config') .. '/custom.lua'
		)
	end
end

M.toggle_theme = function()
  if vim.opt.background == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end

-- open configuration directory
M.edit_conf_dir = function(open_explorer)
  vim.fn.chdir(vim.fn.stdpath 'config')
  if open_explorer then
    LM.fn.toggle_explorer()
  end
end

-- open custom.lua configuration file
M.edit_custom_config = function()
  local command = 'e ' .. vim.fn.stdpath('config') .. '/custom.lua'
  vim.cmd(command)
end

M.format_buffer = function()
  local curpos = vim.fn.getcurpos()
  vim.api.nvim_feedkeys('gg=G', 'n', false)
  for k, v in ipairs(curpos) do print(k, v) end
  vim.fn.cursor(curpos[2], curpos[3])
end

M.delete_buffer = function()
  local count = 0
  for _, v in pairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(v) == 1 then
      count = count + 1
    end
  end
  if count == 1 then
    vim.api.nvim_create_buf(true, true)
  end
  pcall(vim.cmd, 'bprevious!')
  pcall(vim.cmd, 'bdelete!#')
end

-- spawn an external terminal in current directory
M.spawn_terminal = function()
  local job = nil
  -- check if wezterm path is set or it's in PATH
  if (LM.wezterm_path and vim.fn.executable(LM.wezterm_path)) then
    job = LM.wezterm_path .. ' start --cwd .'
    vim.loop.spawn(
      LM.wezterm_path,
      {
        args = { 'start', '--cwd', '.' }
      },
      function(_, _) end
    )
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
          job = 'cmd /C start pwsh'
        else
          job = 'cmd /C start powershell'
        end
      else
        -- unix case
        if vim.fn.executable('xterm') ~= 0 then
          job = 'xterm'
        elseif vim.fn.executable('ghostty') ~= 0 then
          job = 'ghostty'
        elseif vim.fn.executable('konsole') ~= 0 then
          job = 'konsole'
        end
      end
    end
  end
  if job then
    print(job)
    vim.fn.jobstart(job .. ' ' .. vim.cmd('pwd'))
  end
end

return M
