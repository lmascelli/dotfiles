if LM ~= nil then
vim.cmd 'set wildignore+=*/target/*'

if LM.plugins.with_lsp and LM.lsp.servers.rust == nil then
  LM.lsp.setup_server('rust_analyzer', {
    settings = {
      cargo = {
        -- allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      ["rust-analyzer"] = {
        -- checkOnSave = {
        --   -- allFeatures = true,
        --   command = "clippy",
        --   extraArgs = {
        --     "--",
        --     "--no-deps",
        --     -- "-Dclippy::correctness",
        --     -- "-Dclippy::complexity",
        --     -- "-Wclippy::perf",
        --     -- "-Wclippy::pedantic",
        --   }
        -- }
      }
    }
  })

  vim.cmd 'LspStart'

  LM.lsp.servers.rust = true
end
end
