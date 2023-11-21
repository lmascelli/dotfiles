local M = {}
M.on_attach_functions = {
  -- common to all buffers
  -- default one
  default = function(client, bufnr)
    -- with auto_focus hover
    vim.keymap.set('n', '<leader>lk', function()
      vim.lsp.buf.hover()
      vim.lsp.buf.hover()
    end, { buffer = bufnr, desc = "Documentation" })
    -- without auto_focus hover
    -- vim.keymap.set('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = bufnr, desc = "Documentation" })
    vim.keymap.set('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = bufnr, desc = "Definition" })
    vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = bufnr, desc = "Declaration" })
    vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
      { buffer = bufnr, desc = "Implementation" })
    vim.keymap.set('n', '<leader>lgo', '<cmd>lua vim.lsp.buf.type_definition()()<cr>',
      { buffer = bufnr, desc = "Type definition" })
    vim.keymap.set('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr, desc = "References" })
    vim.keymap.set('n', '<leader>lgs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
      { buffer = bufnr, desc = "Signature" })
    vim.keymap.set('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = bufnr, desc = "Signature" })
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr, desc = "Rename" })
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>',
      { buffer = bufnr, desc = "Format" })
    vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr, desc = "Code action" })
    vim.keymap.set('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<cr>',
      { buffer = bufnr, desc = "Show diagnostics" })
    vim.keymap.set('n', '<leader>ldd', '<cmd>lua vim.diagnostic.open_float(nil, {focus=true})<cr>',
      { buffer = bufnr, desc = "Show hover" })
    vim.keymap.set('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<cr>',
      { buffer = bufnr, desc = "Previous diagnostic" })
    vim.keymap.set('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<cr>',
      { buffer = bufnr, desc = "Next diagnostic" })
  end,
  commons = {},

  -- filetype specific
  filetype = {}
}

M.add_on_attach_function = function(f, filetype)
  if filetype == nil then
    table.insert(LM.lsp.on_attach.on_attach_functions.commons, f)
  else
    if LM.lsp.on_attach.on_attach_functions.filetype[filetype] == nil then
      LM.lsp.on_attach.on_attach_functions.filetype[filetype] = {}
    end
    table.insert(LM.lsp.on_attach.on_attach_functions.filetype[filetype], f)
  end
end

M.get_on_attach_functions = function(filetype)
  if filetype ~= nil then
    local on_attach_functions = LM.lsp.on_attach.on_attach_functions.filetype[filetype]
    if on_attach_functions ~= nil then
      return on_attach_functions
    else
      return {}
    end
  end
end

M.on_attach = function(client, bufnr)
  LM.lsp.on_attach.on_attach_functions.default(client, bufnr)
  for _, f in ipairs(LM.lsp.on_attach.on_attach_functions.commons) do
    f(client, bufnr)
  end
  for _, f in ipairs(LM.lsp.on_attach.get_on_attach_functions(vim.bo.filetype)) do
    f(client, bufnr)
  end
end

return M
