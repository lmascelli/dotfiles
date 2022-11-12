local M = {}

--- create a new struct for register a keymap
--- @param map string the key combination to map
--- @param cmd any the cmd to exec, type accepted depends on plugin manager
--- @param mode string | nil the mode to which assign the keymap ('n', 'i', 't', 'v')
--- @param opts table | nil the options of the keymap
function new_keymap_struct(map, cmd, mode, opts)
  return {
    map = map,
    cmd = cmd,
    mode = mode or 'n',
    opts = opts or {
      noremap = false,
      expr = false,
      silent = false,
      nowait = false,
    }
  }
end

M.keymap_provider = 
{
  new = function(set_key_func)
    return {
      set_keymap = set_key_func,
      keymap_struct = new_keymap_struct
    }
  end,
}

return M
