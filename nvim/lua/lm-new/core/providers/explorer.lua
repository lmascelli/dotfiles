local M = {}

--- create a new provider for a plugin manager
--- @param toggle_func function the function used to toggle the the explorer
M.explorer_provider = function (show_func, hide_func, toggle_func, start_shown)
  if not toggle_func then
    vim.notify('Error: provider must provide a toggle function')
  end
  return {
    show = show_func,
    hide = hide_func,
    toggle = toggle_func,
    shown = start_shown or false,
  }
end

return M
