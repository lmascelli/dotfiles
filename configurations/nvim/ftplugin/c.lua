if LM ~= nil then
  if LM.plugins.with_lsp and LM.lsp.servers.c.enabled == false then
    LM.lsp.setup_server('clangd', {
      cmd = {
        "clangd",
        "--background-index",
        "-j=12",
        "--query-driver=" .. LM.lsp.c_query_driver,
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
      },
      capabilities = LM.lsp.capabilities,
      init_options = {
        clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
      },
    })

    vim.cmd 'LspStart'
    LM.lsp.servers.c.enabled = true
  end
end
