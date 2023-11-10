return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = { "mason-lspconfig.nvim" },
  },
  {
    'williamboman/mason.nvim',
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
    build = function()
      pcall(vim.cmd, 'MasonUpdate')
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    cmd = { "LspInstall", "LspUninstall" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = true,
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_installation = true,
      })

      local lspconfig = require('lspconfig')

      local setup_server = function(server, opts)
        opts = opts or {}
        opts.on_attach = LM.lsp.on_attach.default
        lspconfig[server].setup(opts)
      end

      setup_server('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = vim.split(package.path, ';'),
            },
            diagnostics = {
              globals = { 'vim', 'LM', },
            },
            workspace = {
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
            },
          }
        },
      })
      setup_server('clangd', {
        cmd = {
          "clangd",
          "--background-index",
          "-j=12",
          "--query-driver=" .. LM.lsp.c_query_driver,
          "--clang-tidy",
          "--clang-tidy-checks=*",
          "--all-scopes-completion",
          "--cross-file-rename",
          "--completion-style=detailed",
          "--header-insertion-decorators",
          "--header-insertion=iwyu",
          "--pch-storage=memory",
        },
        capabilities = LM.lsp.capabilities,
        init_options = {
          clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
          usePlaceholders = true,
          completeUnimported = true,
          semanticHighlighting = true,
        },
      })
      setup_server('pylsp')
      -- to install also mypy run ':PylspInstall pyls-flake8 pylsp-mypy pyls-isort'
      setup_server('powershell_es')
    end
  }
}
