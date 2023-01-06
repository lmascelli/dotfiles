return function (data)
  data.lspconfig.pylsp.setup {
    on_attach = function(client, bufnr)
      data.on_attach(client, bufnr)
      LM.keymap.set_keymap("n", "<leader>lf",
        '<cmd>lua LM.format_black()<cr>', {}, nil, 'format with black')
    end
  }
end
