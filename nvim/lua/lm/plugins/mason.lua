local M = {}

M.name = "mason"

M.url = "williamboman/mason-lspconfig.nvim"

M.requires = {
	{ url = "williamboman/mason.nvim" },
  { url = "neovim/nvim-lspconfig" } ,
	-- { url = "p00f/clangd_extensions.nvim", }
}

M.config = function()
	local ok_mason, mason = pcall(require, 'mason')
	local ok_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
	local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')

	if ok_mason and ok_mason_lspconfig and ok_lspconfig then
		mason.setup()
		mason_lspconfig.setup()

		lspconfig.util.default_config = vim.tbl_extend(
			"force",
			lspconfig.util.default_config,
			{
				on_attach = on_attach
			}
		)

		local lsp_list = LM.config.lsp_list or {}

		for k, v in pairs(lsp_list) do
			local status_ok, server = pcall(require, 'lm.lsp_servers.' .. v)
			if status_ok then
				local ok, _ = pcall(server, {
					on_attach = on_attach,
					lspconfig = lsp_config,
				})
				if not ok then
					vim.notify('server ' .. v .. ' not loaded')
				end
			else
				vim.notify('server ' .. v .. ' not loaded')
			end
		end
	end
end

return M