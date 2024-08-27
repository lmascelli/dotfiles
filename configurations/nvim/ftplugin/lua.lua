if LM ~= nil then
  if LM.plugins.with_lsp and LM.lsp.servers.lua.enabled == false then
    LM.lsp.setup_server('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim', 'LM', },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
          },
        }
      },
    })

    vim.cmd 'LspStart'

    LM.lsp.servers.lua.enabled = true
  end
end
