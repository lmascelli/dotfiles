return {
  lua = {
    name = "lua-language-server",
    cmd = { "lua-language-server" },
    root_dir = vim.fs.root(0,
      { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }),
    filetypes = { "lua" },
    on_init = function(client)
      local path = vim.tbl_get(client, "workspace_folders", 1, "name")
      if not path then
        vim.print("no workspace")
        return
      end
      client.settings = vim.tbl_deep_extend('force', client.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim', 'LM', },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })
    end,
  },

  python = {
    name = "pylsp",
    cmd = { "pylsp" },
  },

  rust = {
    name = "rust-analyzer",
    cmd = { "rust-analyzer" },
    root_dir = vim.fs.root(0, { "Cargo.toml" }),
    filetypes = { "rust" },
  },
}
