local M = {}

local packer = require 'lm.modules.plugins.packer'
local plugin_provider = require 'lm.core.providers.plugins'

M.priority = packer.priority
M.setup = packer.setup
M.config = packer.config

if packer.setup() then
  if packer.config() then
    LM.providers.plugin_provider = plugin_provider.new_plugin_provider(packer.use)
  else
    vim.notify 'ERROR: packer installation corrupted.'
    return nil
  end
else
  return nil
end

return M
