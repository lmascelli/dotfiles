-------------------------------------------------------------------------------
-- gloabl LM table
-------------------------------------------------------------------------------
LM = {
  g = {
    opts = {},
    settings = {},
  },
}

require 'lm.os'
LM.options = require 'lm.options'
LM.custom = require 'lm.custom'
LM.plugins = require 'lm.plugins'
require 'lm.utils'
require 'lm.filetypes'

-------------------------------------------------------------------------------
-- load default environment values
-------------------------------------------------------------------------------
local defaults = LM.options.defaults
LM.options.load_options(defaults.opts, defaults.settings)

-------------------------------------------------------------------------------
-- setup custom config
-------------------------------------------------------------------------------
local custom = LM.custom.load_custom()
if custom then
  --- apply vim options and settings
  LM.options.load_options(custom.opts, custom.settings)
end


-------------------------------------------------------------------------------
-- apply options and settings
-------------------------------------------------------------------------------
LM.options.apply_options(LM.g.opts, LM.g.settings)

-------------------------------------------------------------------------------
-- defaults providers
-------------------------------------------------------------------------------
require 'lm.keymaps'
require 'lm.explorer'

if custom then
  -- install plugins
  for _, v in pairs(custom.plugin_list) do
    LM.plugins.install(v)
  end
end

if vim.g.neovide then
  require 'lm.neovide'
end
require 'lm.colorscheme'

if custom and custom.after then
  custom.after()
end
