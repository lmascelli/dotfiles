LM = require 'lm.globals'
local options = require 'lm.options'
local custom = require 'lm.custom'
LM.plugins = require 'lm.plugins'
require 'lm.utils'
require 'lm.filetypes'

-------------------------------------------------------------------------------
-- load default environment values
-------------------------------------------------------------------------------
local defaults = options.defaults
options.load_options(defaults.opts, defaults.settings)

-------------------------------------------------------------------------------
-- setup custom config
-------------------------------------------------------------------------------
local config = custom.load_custom()
if config then
  LM.config = config
  --- apply vim options and settings
  options.load_options(config.opts, config.settings)
end

-------------------------------------------------------------------------------
-- apply options and settings
-------------------------------------------------------------------------------
options.apply_options(LM.g.opts, LM.g.settings)

-------------------------------------------------------------------------------
-- defaults providers
-------------------------------------------------------------------------------
local default_keymap = require 'lm.keymaps'
LM.keymap = {
  set_keymap = default_keymap,
}

require 'lm.explorer'

if config then
  -- install plugins
  for _, v in pairs(config.plugin_list) do
    LM.plugins.install(v)
  end
end

if vim.g.neovide then
  require 'lm.neovide'
end

require 'lm.colorscheme'

if config and config.after then
  config.after()
end
