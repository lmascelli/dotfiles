local keymap = LM.keymap.set_keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts, bufnr, '')
  keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts, bufnr, '')
  keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts, bufnr, '')
  keymap('n', '<leader>ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts, bufnr, '')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, bufnr, '')
  keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, bufnr, '')
  keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, bufnr, '')
  keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, bufnr, '')
  keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, '')
  keymap('i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, bufnr, '')
  keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, bufnr, '')
  keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, bufnr, '')
  keymap('n', '<leader>lwl',
    '<cmdint(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, bufnr, '')
  keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, bufnr, '')
  keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, bufnr, '')
  keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, bufnr, '')
  keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, bufnr, '')
  keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts, bufnr, '')
end


return {
  setup = function(use)
    use { 'williamboman/nvim-lsp-installer',
      { 'neovim/nvim-lspconfig' },
      'p00f/clangd_extensions.nvim',
    }
  end,

  config = function()
    local lspconfig = require 'lspconfig'
    require 'nvim-lsp-installer'.setup {}

    lspconfig.util.default_config = vim.tbl_extend(
      "force",
      lspconfig.util.default_config,
      {
        on_attach = on_attach
      }
    )

    local lsp_list
    local settings = require 'lm_settings'
    if settings.lsp_list then
      lsp_list = settings.lsp_list
    else
      lsp_list = {}
    end

    for k, v in pairs(lsp_list) do
      status_ok, server = pcall(require, 'lm.lsp_servers.' .. v)
      if status_ok then
        server {
          on_attach = on_attach,
        }
      else
        vim.notify('server ' .. v .. ' not loaded')
      end
    end
  end
}
