return {
  get_on_attach = function(filetype)
    local on_attach = LM.lsp.on_attach[filetype]
    if on_attach == nil then
      return function() end
    else
      return on_attach
    end
  end
}
