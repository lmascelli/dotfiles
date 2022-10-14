local lspconfig = require 'lspconfig'

return function(data)
  require 'clangd_extensions'.setup {
    server = {
      on_attach = function(client, bufnr)
        data.on_attach(client, bufnr)
        if vim.g.lm['which-key-enabled'] then
          local wk = require 'which-key'
          wk.register {
            ["<leader>lh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Source-Header" },
          }
        end
      end,
      cmd = {
        "clangd",
        "--log=verbose",
      },
    },
    extensions = {
      inlay_hints = {
        only_current_line = true,
      },
      cmd = { "clangd", "--completion-style=detailed" },
    },
  }
end
