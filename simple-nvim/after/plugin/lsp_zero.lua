local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp.default_keymaps({buffer = bufnr})
	vim.keymap.set("n", "<leader>l", function() end, { desc = "Lsp" })
	vim.keymap.set('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = "Documentation" })
	vim.keymap.set("n", "<leader>lg", function() end, { desc = "Go to" })
	vim.keymap.set('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = "Definition" })
	vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = "Declaration" })
	vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = "Implementation" })
	vim.keymap.set('n', '<leader>lgo', '<cmd>lua vim.lsp.buf.type_definition()()<cr>', { desc = "Type definition" })
	vim.keymap.set('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = "References" })
	vim.keymap.set('n', '<leader>lgs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = "Signature" })
	vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename" })
	vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { desc = "Format" })
	vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Code action" })
	vim.keymap.set("n", "<leader>ld", function() end, { desc = "Diagnostics" })
	vim.keymap.set('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = "Show diagnostics" })
	vim.keymap.set('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { desc = "Previous diagnostic" })
	vim.keymap.set('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<cr>', { desc = "Next diagnostic" })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
