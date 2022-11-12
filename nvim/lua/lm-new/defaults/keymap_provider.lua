local keymap_provider = require 'lm.core.providers.keymap'.keymap_provider

opts = {
  noremap = false,
  silent = true,
}

local function set_keymap(map_str, buf)
  if buf then
    vim.api.nvim_buf_set_keymap(buf, map_str['mode'], map_str['map'], map_str['cmd'], map_str['opts'] or opts)
  else 
    vim.api.nvim_set_keymap(map_str['map'], map_str['cmd'], map_str['mode'], map_str['opts'] or opts)
  end
end

LM.providers.keymap_provider = keymap_provider.new(set_keymap)

return map_key
