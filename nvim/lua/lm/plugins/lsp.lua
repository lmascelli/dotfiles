local M = {}
M.name = 'lsp stuff'
M.url = "williamboman/mason-lspconfig.nvim"

M.requires = {
	{ url = "williamboman/mason.nvim" },
  { url = "neovim/nvim-lspconfig" },
	{ url = "p00f/clangd_extensions.nvim", },
}

local on_attach = function(_, bufnr) -- hidden parameter client
  local keymap = LM.keymaps.set_keymap
	local opts = { noremap = true, silent = true }
	keymap('n', '<leader>l', '', opts, bufnr, 'lsp')
	keymap('n', '<leader>ld', '', opts, bufnr, 'diagnostic')
	keymap('n', '<leader>lde', '<cmd>lua vim.diagnostic.open_float()<CR>', opts, bufnr, 'list float')
	keymap('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts, bufnr, 'prev')
	keymap('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts, bufnr, 'next')
	keymap('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts, bufnr, 'list')

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	keymap('n', '<leader>lg', '', opts, bufnr, 'go to')
	keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, bufnr, 'declaration')
	keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, bufnr, 'definition')
	keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, bufnr, 'implementation')
	keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, bufnr, 'type definition')
	keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, bufnr, 'references')
	keymap('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, bufnr, 'documentation')
	keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, 'signature')
	keymap('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, '')
	keymap('n', '<leader>lw', '', opts, bufnr, 'workspace')
	keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, bufnr, 'add')
	keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, bufnr, 'remove')
	keymap('n', '<leader>lwl',
		'<cmdint(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, bufnr, 'list')
	keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, bufnr, 'rename')
	keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, bufnr, 'code action')
	keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts, bufnr, 'format')
end

M.config = function()
	local ok_mason, mason = pcall(require, 'mason')
	local ok_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
	local ok_lsp, lsp_config = pcall(require, 'lspconfig')

	if ok_mason and ok_mason_lspconfig then
		mason.setup()
		mason_lspconfig.setup()
	end


	if ok_lsp then
		lsp_config.util.default_config = vim.tbl_extend(
			"force",
			lsp_config.util.default_config,
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
