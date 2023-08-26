return {
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

  -- toggle the colorcolumn at line 80
  toggle_colorcolumn = function()
    if vim.opt.colorcolumn ~= '80' then
      vim.opt.colorcolumn = tostring(80)
    else
      vim.opt.colorcolumn = tostring()
    end
  end,

  -- open configuration directory
  edit_conf_dir = function(open_explorer)
    vim.fn.chdir(vim.fn.stdpath 'config')
    if open_explorer then
      vim.cmd 'Lex 25'
    end
  end,
}
