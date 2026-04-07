vim.api.nvim_create_autocmd('LspAttach', {
  group = LM.augroups.lspconfig,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end
})

-- q closes quickfix window
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    if ev.file == "qf" then
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true })
  end
  end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.window = capabilities.window or {}
capabilities.window.workDoneProgress = true

-- https://microsoft.github.io/language-server-protocol/specifications/specification-3-17/#completionClientCapabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true

LM.lsp = {
  capabilities = capabilities,
  on_attach = require 'lm.runtime.lsp.on_attach',
  configs = require 'lm.runtime.lsp.configs',
  c_query_driver = 'g++',
  servers = {},
}
