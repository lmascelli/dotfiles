return function (data)
  local ok, lspconfig = pcall(require, 'lspconfig')
  if ok then
    lspconfig.pylsp.setup {
      on_attach = function(client, bufnr)
        data.on_attach(client, bufnr)
        LM.keymap.set_keymap("n", "<leader>lf",
          '<cmd>lua LM.format_black()<cr>', {}, nil, 'format with black')
      end
    }
  else
  end
end
