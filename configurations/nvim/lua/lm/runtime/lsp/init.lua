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

-- Check if LSP is enabled in the current buffer
local function is_enabled()
  local clients = vim.lsp.get_clients({
    bufnr = vim.api.nvim_get_current_buf()
  })
  if next(clients) ~= nil then
    return true
  else
    return false
  end
end

LM.lsp = {
  capabilities = require 'lm.runtime.lsp.capability',
  on_attach = require 'lm.runtime.lsp.on_attach',
  c_query_driver = 'g++',
  is_enabled = is_enabled,
}
