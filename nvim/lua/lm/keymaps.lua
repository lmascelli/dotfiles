--default keyamp function
local function default_set_keymap(mode, map, expr, opts, buf, name)
  opts = {
    silent = opts.silent or true,
    noremap = opts.noremap or false,
    expr = opts.expr or false,
    nowait = opts.nowait or false,
    desc = name or '',
  }
  if buf then
    vim.api.nvim_buf_set_keymap(buf, mode, map, expr, opts)
  else
    vim.api.nvim_set_keymap(mode, map, expr, opts)
  end
end

local function default_add_map(mode, map, expr, opts, buf, name)
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

return {
  maps = {},
  add_map = default_add_map,
  set_keymap = default_set_keymap,
}
