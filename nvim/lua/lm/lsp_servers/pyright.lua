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
      if vim.g.lm['which-key-enabled'] then
        local wk = require 'which-key'
        wk.register {
          ['<leader>'] = {
            l = {
              f = { '<cmd>lua vim.g.lm.format_black()<cr>', 'format with black' }
            }
          }
        }
      else
        vim.fn.nvim_buf_set_keymap(bufnr, 'n', '<cmd>lua vim.g.lm.format_black()<cr>', { noremap = true })
      end
    end
  }
end
