-------------------------------------------------------------------------------
-- initialize the global space symbol LM and populate it with the required
-- modules
-------------------------------------------------------------------------------
require 'lm.globals'
require 'lm.options'
require 'lm.keymaps'
require 'lm.explorer'
require 'lm.utils'

-------------------------------------------------------------------------------
-- load default and custom values
-------------------------------------------------------------------------------
require 'lm.defaults'
require 'lm.custom'

local config = LM.custom.load_custom()
if config then
  LM.config = config
  --- apply vim options and settings
  LM.options.load_options(config.opts, config.settings)
end

LM.options.apply_options(LM.options.opts, LM.options.settings)
LM.font.load_custom()

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
require 'lm.plugins'

if LM.plugins.manager then
  if config and config.load_plugins then
    for _, v in pairs(config.plugin_list) do
      local ok, p = pcall(require, 'lm.plugins.' .. v)
      if ok then
        LM.plugins.add_to_list(p)
      end
    end
    LM.plugins.before()
  end
else
  print 'No plugin manager set up'
end

-------------------------------------------------------------------------------
-- appearence settings
-------------------------------------------------------------------------------
require 'lm.appearence.colorscheme'
