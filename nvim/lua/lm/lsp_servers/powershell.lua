local lspconfig = require 'lspconfig'

return function(data)
  lspconfig.powershell_es.setup {}
end
