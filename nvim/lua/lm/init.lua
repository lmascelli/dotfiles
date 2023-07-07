-------------------------------------------------------------------------------
-- initialize the global space symbol LM and populate it with the required
-- modules
-------------------------------------------------------------------------------
require 'lm.globals'
require 'lm.augroups'
require 'lm.options'
require 'lm.keymaps'
require 'lm.explorer'
require 'lm.utils'

-------------------------------------------------------------------------------
-- load default and custom values
-------------------------------------------------------------------------------
require 'lm.defaults'
require 'lm.custom'

if LM.custom.config then
  --- apply vim options and settings
  LM.options.load_options(LM.custom.config.opts, LM.custom.config.settings)
end
LM.options.apply_options(LM.options.opts, LM.options.settings)
LM.font.load_custom()

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
require 'lm.plugins'

if LM.plugins.manager then
  if LM.custom.config and LM.custom.config.load_plugins then
    for _, v in pairs(LM.custom.config.plugin_list) do
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
-- load colorscheme
-------------------------------------------------------------------------------
LM.api.load_default_colorscheme()
