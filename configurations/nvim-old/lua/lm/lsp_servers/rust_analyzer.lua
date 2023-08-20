return function (data)
  data.lspconfig['rust_analyzer'].setup {
    on_attach = data.on_attach,
  }
end
