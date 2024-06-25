LM.api.diagnostics = {
  list_errors = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.setloclist()
    else
      vim.cmd 'clist'
    end
  end,

  next_error = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.goto_next()
    else
      vim.cmd 'cnext'
    end
  end,

  previous_error = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.goto_prev()
    else
      vim.cmd 'cprevious'
    end
  end,
}
