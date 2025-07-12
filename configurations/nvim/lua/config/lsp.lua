vim.api.nvim_create_autocmd('LspAttach', {
  group = LM.augroups.lspconfig,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end })

-- q closes quickfix window
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    if ev.file == "qf" then
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true })
  end
  end
})


-- taken from https://github.com/adibhanna/nvim
-- LspStatus
-- local function lsp_status()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local clients = vim.lsp.get_clients({ bufnr = bufnr })
--
--     if #clients == 0 then
--         print("󰅚 No LSP clients attached")
--         return
--     end
--
--     print("󰒋 LSP Status for buffer " .. bufnr .. ":")
--     print("─────────────────────────────────")
--
--     for i, client in ipairs(clients) do
--         print(string.format("󰌘 Client %d: %s (ID: %d)", i, client.name, client.id))
--         print("  Root: " .. (client.config.root_dir or "N/A"))
--         print("  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))
--
--         -- Check capabilities
--         local caps = client.server_capabilities
--         local features = {}
--         if caps.completionProvider then table.insert(features, "completion") end
--         if caps.hoverProvider then table.insert(features, "hover") end
--         if caps.definitionProvider then table.insert(features, "definition") end
--         if caps.referencesProvider then table.insert(features, "references") end
--         if caps.renameProvider then table.insert(features, "rename") end
--         if caps.codeActionProvider then table.insert(features, "code_action") end
--         if caps.documentFormattingProvider then table.insert(features, "formatting") end
--
--         print("  Features: " .. table.concat(features, ", "))
--         print("")
--     end
-- end
-- vim.api.nvim_create_user_command('LspStatus', lsp_status, { desc = "Show detailed LSP status" })
