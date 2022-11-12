local M = {}
local opt = vim.opt

-- load base options values
require 'lm.defaults.basic_options'

M.load_custom_options = function()
	local custom_config = require 'lm.core.custom'.load_custom_config()
	for k, v in pairs(custom_config.options) do
		LM.options[k] = v
	end

	for k, v in pairs(custom_config.settings) do
		LM.settings[k] = v
	end
end

M.apply_options = function()
	for k, v in pairs(LM.options) do
		opt[k] = v
	end

	if LM.settings.colorcolumn > 0 then
		vim.o.colorcolumn = tostring(LM.settings.colorcolumn)
	end

	if not LM.settings.terminal_line_number then
		-- no number in terminal mode
		vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"
	end

	if not LM.EOF_indicator then
		-- no EOF indicator ~ 
		vim.cmd ":set fillchars+=eob:\\ "
	end

	if LM.settings.italic_comments then
		-- italic font for comments
		vim.cmd "highlight Comment cterm=italic gui=italic"
	end
end

return M
