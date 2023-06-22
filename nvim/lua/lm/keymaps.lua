local keymaps = {
  maps = {},
}

keymaps.set_keymap = function(mode, map, expr, opts, buf, name)
  local a_opts = {
    silent = true,
    noremap = false,
    expr = false,
    nowait = false,
    desc = '',
  }
  if opts then
    a_opts = {
      silent = opts.silent or true,
      noremap = opts.noremap or false,
      expr = opts.expr or false,
      nowait = opts.nowait or false,
      desc = name or '',
    }
  end
  if buf then
    vim.api.nvim_buf_set_keymap(buf, mode, map, expr, a_opts)
  else
    vim.api.nvim_set_keymap(mode, map, expr, a_opts)
  end
end

keymaps.add_map = function(mode, map, expr, opts, buf, name)
  table.insert(LM.keymaps.maps,
    {
      mode = mode,
      map = map,
      expr = expr,
      opts = opts,
      buf = buf,
      name = name or nil,
    })
end

LM.keymaps = keymaps
