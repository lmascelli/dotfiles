LM.lsp = {
  c_query_driver = 'g++',
  on_attach = {},
  capabilities = require 'lm.runtime.lsp.capability',

  get_on_attach = function(filetype)
    local on_attach = LM.lsp.on_attach[filetype]
    if on_attach == nil then
      return function() end
    else
      return on_attach
    end
  end
}
