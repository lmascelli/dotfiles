LM.utils = {
  -- execute a command attaching it to a new buffer
  exec_cmd = function(cmd)
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
  end,

  -- open configuration directory
  edit_conf_dir = function(open_explorer)
    vim.fn.chdir(vim.fn.stdpath 'config')
    if open_explorer then
      LM.toggle_explorer()
    end
  end,

  -- open custom.lua configuration file
  edit_custom_config = function()
    local command = 'e ' .. vim.fn.stdpath('config') .. '/custom.lua'
    vim.cmd(command)
  end,

  -- open custom.lua configuration file
  edit_init_file = function()
    local command = 'e ' .. vim.fn.stdpath('config') .. '/init.lua'
    vim.cmd(command)
  end,

  -- join paths from lunarvim
  join_paths = function(...)
    local result = table.concat({ ... }, '/')
    return result
  end,

  is_directory = function(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "directory" or false
  end,

  eval_buffer = function()
    vim.cmd '%lua'
  end,

  eval_region = function()
    vim.cmd "'<,'>lua"
  end,
}
