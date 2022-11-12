local lspconfig = require 'lspconfig'

return function(data)
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  lspconfig.sumneko_lua.setup {
    on_attach = data.on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          }
        },
        telemetry = {
          enable = false,
        }
      }
    },
    -- capabilities = capabilities,
  }
end
