local M = {}

M.name = 'which-key'
M.url = 'folke/which-key.nvim'
M.lazy = false
M.config = function(params)
	local ok, wk = pcall(require, 'which-key')
	if ok then
		wk.setup {
			window = {
				border = "none",
				margin = { 1, 1, 1, 1 },
				padding = { 2, 2, 2, 2 },
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 5,
				align = "left",
			},
			show_help = true,
		}
		vim.opt.timeoutlen = 500

		vim.api.nvim_create_autocmd("Colorscheme", {
			callback = function()
				vim.cmd "highlight link WhichKeyFloat CursorColumn"
			end
		})

		local function wk_set_keymap(mode, map, expr, opts, buf, name)
			opts = opts or {
				silent = true,
				noremap = true,
				nowait = false,
			}
			local mapping = {}
			local mapping_data = {}
			if string.len(expr) > 0 then
				table.insert(mapping_data, 0, expr)
				table.insert(mapping_data, 1, name)
			else
				mapping_data.name = name or ''
			end
			mapping[map] = mapping_data

			local wk_opts = {
				mode = mode,
				buffer = buf,
				silent = opts.silent,
				noremap = opts.noremap,
				nowait = opts.nowait,
			}
			wk.register(mapping, wk_opts)
		end

		LM.keymap.set_keymap = wk_set_keymap

	end

end

return M
