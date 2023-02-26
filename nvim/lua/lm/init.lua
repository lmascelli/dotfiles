LM = require 'lm.globals'
local options = require 'lm.options'
local custom = require 'lm.custom'
local defaults = require 'lm.defaults'
local utils = require 'lm.utils'
LM.plugins = require 'lm.plugins'
LM.font = utils.font

-------------------------------------------------------------------------------
-- load default environment values
-------------------------------------------------------------------------------
defaults.options()

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
LM.font.load_custom()

-------------------------------------------------------------------------------
-- defaults providers
-------------------------------------------------------------------------------
-- keymap provider
local default_keymap = require 'lm.keymaps'
LM.keymap = {
	set_keymap = default_keymap,
}

-- explorer provider
require 'lm.explorer'

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
if config.load_plugins then
	for _, v in pairs(config.plugin_list) do
		local ok, p = pcall(require, 'lm.plugins.' .. v)
		if ok then
			LM.plugins.install(p)
		end
	end
	LM.plugins.pre()
end

-------------------------------------------------------------------------------
-- appearence settings
-------------------------------------------------------------------------------
require 'lm.colorscheme'
