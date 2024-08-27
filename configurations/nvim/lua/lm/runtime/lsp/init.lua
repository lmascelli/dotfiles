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

local function configure(language)
  local config = LM.languages[language]
  if config ~= nil then
    config = config.lsp_config
    if vim.fn.executable(config.cmd[1]) ~= 0 then
      vim.api.nvim_create_autocmd("FileType", {
        group = LM.augroups.lsp,
        pattern = config.filetypes,
        callback = function(ev)
          vim.lsp.start(config, {
            bufnr = ev.buf
          })
        end
      })
    else
      vim.print("LM.lsp.configure: " .. language .. " not present in configurations")
    end
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LMLspAttach", { clear = false }),
    callback = function(ev)
      vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
      vim.bo[ev.buf].formatexpr = 'v:lua.vim.lsp.formatexpr()'
    end
  })
end

LM.lsp = {
  capabilities = require 'lm.runtime.lsp.capability',
  on_attach = require 'lm.runtime.lsp.on_attach',
  configure = configure,
  c_query_driver = 'g++',
  is_enabled = is_enabled,
  servers = {},
}
