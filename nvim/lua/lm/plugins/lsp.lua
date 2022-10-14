local on_attach = function(client, bufnr)
  if vim.g.lm['which-key-enabled'] then
    local wk = require 'which-key'
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    wk.register {
      ["<leader>"] = {
        l = {
          name = '+lsp',
          f = { '<cmd>lua vim.lsp.buf.formatting {async = true}<cr>', 'Format buffer' },
          d = {
            name = "+diagnostics",
            e = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Diagnostics' },
            n = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Next problem' },
            p = { '<cmd>lua vim.diagnostic.goto_previous()<cr>', 'Previous problem' },
            l = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Set loc list' },
          },
          K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Documentation' },
          k = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Signature help' },
          D = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
          ["ql"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
          ["rn"] = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Refactor' },
          ["ca"] = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code actions' },
          w = {
            name = "+workspace",
            a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Add workspace folder' },
            r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Remove workspace folder' },
            l = { '<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>', 'List workspace folder' },
          },
          g = {
            name = "+Go to",
            d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Definition' },
            D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Declaration' },
            i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Implementation' },
            r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
          }
        }
      }
    }
  else
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'i', '<c-l>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwl',
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
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
