vim.diagnostic.config {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = LM.icons.diagnostics.Error },
      { name = "DiagnosticSignWarn",  text = LM.icons.diagnostics.Warning },
      { name = "DiagnosticSignHint",  text = LM.icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo",  text = LM.icons.diagnostics.Information },
    },
  },
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = LM.appearence.floating_border_style,
    source = true,
    header = "",
    prefix = "",
  },
}

-- that is pure lunarvim knowledge
-- for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
--   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
-- end

LM.diagnostics = {
  list_errors = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.setloclist()
    else
      vim.cmd 'clist'
    end
  end,

  next_error = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.jump({
        count = 1,
        float = true,
      })
    else
      vim.cmd 'cnext'
    end
  end,

  previous_error = function()
    if LM.lsp.is_enabled() then
      vim.diagnostic.jump({
        count = -1,
        float = true,
      })
    else
      vim.cmd 'cprevious'
    end
  end,
}
