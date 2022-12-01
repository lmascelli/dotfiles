local lspconfig = require 'lspconfig'

return function (data)
  lspconfig['rust_analyzer'].setup {
    on_attach = data.on_attach,
  }
end
