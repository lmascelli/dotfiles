LM.clangd_create_mingw_conf = function()
  vim.fn.writefile({ "CompileFlags:",
    " Add: [-target, x86_64-pc-windows-gnu]" },
    ".clangd")
end

return function(data)
  require 'clangd_extensions'.setup {
    server = {
      on_attach = function(client, bufnr)
        data.on_attach(client, bufnr)
        if LM.which_key_enabled then
          local wk = require 'which-key'
          wk.register {
            ["<leader>lh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Source-Header" },
            ["<leader>lcl"] = { "<cmd>lua vim.g.lm['clangd_create_mingw_conf']()<cr>",
              "Create .clangd for mingw" },
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
