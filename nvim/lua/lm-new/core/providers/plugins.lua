local M = {}

--- create a new provider for a plugin manager
--- @param use_func function the function used to install a provider
--- @param config_func function? the table to pass to the configuration of the plugin
M. new_plugin_provider = function(use_func, config_func)
  if not use_func then
    vim.notify('Error: provider must provide a use function')
  end
  return {
    use = use_func,
    config = config_func,
  }
end

return M
