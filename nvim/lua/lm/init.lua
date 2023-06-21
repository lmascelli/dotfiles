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


-------------------------------------------------------------------------------
-- load custom config
-------------------------------------------------------------------------------
local config = LM.custom.load_custom()
if config then
	LM.config = config
	--- apply vim options and settings
	LM.options.load_options(config.opts, config.settings)
end

-------------------------------------------------------------------------------
-- apply options and settings
-------------------------------------------------------------------------------
LM.options.apply_options(LM.options.opts, LM.options.settings)
LM.font.load_custom()

-------------------------------------------------------------------------------
-- defaults providers
-------------------------------------------------------------------------------
-- keymap provider

-- explorer provider

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
LM.plugins = require 'lm.plugins'

if config.load_plugins then
	for _, v in pairs(config.plugin_list) do
		local ok, p = pcall(require, 'lm.plugins.' .. v)
		if ok then
			LM.plugins.add_to_list(p)
		end
	end
	LM.plugins.pre()
end

-------------------------------------------------------------------------------
-- appearence settings
-------------------------------------------------------------------------------
require 'lm.appearence.colorscheme'
