-- gloabl LM table
LM = {
  g = {
    opts = {},
    settings = {},
  },
}
require 'lm.os'
LM.options = require 'lm.options'
LM.custom = require 'lm.custom'

-------------------------------------------------------------------------------
-- load default environment values
-------------------------------------------------------------------------------
local defaults = LM.options.defaults
LM.options.load_options(defaults.opts, defaults.settings)

-------------------------------------------------------------------------------
-- custon config values
-------------------------------------------------------------------------------
local custom = LM.custom.load_custom()
if custom then
  LM.options.load_options(custom.opts, custom.settings)
end

LM.options.apply_options(LM.g.opts, LM.g.settings)

-------------------------------------------------------------------------------
-- defaults providers
-------------------------------------------------------------------------------
require 'lm.keymaps'
require 'lm.explorer'

require 'lm.utils.utils'
require 'lm.plugins'
if vim.g.neovide then
  require 'lm.neovide'
end
require 'lm.colorscheme'
require 'lm.filetypes'

local after = require('lm_settings').after
if after then
  after()
end
