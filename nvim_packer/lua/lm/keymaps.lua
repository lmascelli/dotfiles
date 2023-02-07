--default keyamp function
local function default_keymap(mode, map, expr, opts, buf, name)
  opts = opts or {
    silent = true,
    noremap = false,
    expr = false,
    nowait = false,
  }
  if buf then
    vim.api.nvim_buf_set_keymap(buf, mode, map, expr, opts)
  else
    vim.api.nvim_set_keymap(mode, map, expr, opts)
  end
end

return default_keymap
