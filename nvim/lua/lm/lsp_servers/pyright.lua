local lspconfig = require 'lspconfig'

return function(data)
  -- lspconfig.pylsp.setup {
  --   on_attach = data.on_attach,
  --   cmd = { "pylsp", "-v" },
  --   -- cmd_env = { VIRTUAL_ENV = get_python_venv(),
  --   --   PATH = lsputil.path.join(get_python_venv(), 'bin') .. ':' .. vim.env.PATH,
  --   -- }
  -- }
  lspconfig.pyright.setup {
    on_attach = function(client, bufnr)
      data.on_attach(client, bufnr)
      LM.keymap.set_keymap("n", "<leader>lf",
        '<cmd>lua LM.format_black()<cr>', {}, nil, 'format with black')
    end
  }
end
