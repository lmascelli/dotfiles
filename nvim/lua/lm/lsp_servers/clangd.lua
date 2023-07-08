return function(data)
  LM.clangd_create_mingw_conf = function()
    vim.fn.writefile({ "CompileFlags:",
      " Add: [-target, x86_64-pc-windows-gnu]" },
      ".clangd")
  end
  require 'clangd_extensions'.setup {
    server = {
      on_attach = function(client, bufnr)
        local keymap = LM.keymaps.set_keymap
        data.on_attach(client, bufnr)
        keymap("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", {}, nil,
          "Switch Source-Header")
        keymap("n", "<leader>lcl", "<cmd>lua LM.clangd_create_mingw_conf()<cr>",
          {}, nil, "Create .clangd for mingw")
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
