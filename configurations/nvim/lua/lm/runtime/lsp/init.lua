local function make_menu(bufnr)
  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.cmd([[
            :amenu 10 PopUp.hover <cmd>lua vim.lsp.buf.hover()<cr>
            ]])
    end,
    group = LM.augroups.lsp_menu,
    buffer = bufnr,
  })

  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
      vim.cmd([[
            :silent! unmenu PopUp.hover
            ]])
    end,
    group = LM.augroups.lsp_menu,
    buffer = bufnr,
  })
end

LM.lsp = {
  on_attach = {
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
      vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = bufnr, desc = "Implementation" })
      vim.keymap.set('n', '<leader>lgo', '<cmd>lua vim.lsp.buf.type_definition()()<cr>', { buffer = bufnr, desc = "Type definition" })
      vim.keymap.set('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr, desc = "References" })
      vim.keymap.set('n', '<leader>lgs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = bufnr, desc = "Signature" })
      vim.keymap.set('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = bufnr, desc = "Signature" })
      vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr, desc = "Rename" })
      vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async=true})<cr>', { buffer = bufnr, desc = "Format" })
      vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr, desc = "Code action" })
      vim.keymap.set('n', '<leader>ldl', '<cmd>lua vim.diagnostic.setloclist()<cr>', { buffer = bufnr, desc = "Show diagnostics" })
      vim.keymap.set('n', '<leader>ldd', '<cmd>lua vim.diagnostic.open_float(nil, {focus=true})<cr>', { buffer = bufnr, desc = "Show hover" })
      vim.keymap.set('n', '<leader>ldp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', { buffer = bufnr, desc = "Previous diagnostic" })
      vim.keymap.set('n', '<leader>ldn', '<cmd>lua vim.diagnostic.goto_next()<cr>', { buffer = bufnr, desc = "Next diagnostic" })

      -- make_menu(bufnr)
      LM.lsp.get_on_attach(vim.bo.filetype)(client, bufnr)
    end,
  },

  capabilities = require 'lm.runtime.lsp.capability',

  get_on_attach = function(filetype)
    local on_attach = LM.lsp.on_attach[filetype]
    if on_attach == nil then
      return function(client, bufnr) end
    else
      return on_attach
    end
  end,

  c_query_driver = 'g++',
}
