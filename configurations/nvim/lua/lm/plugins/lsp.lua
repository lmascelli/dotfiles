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
    cmd = { "LspInstall", "LspUninstall"},
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    lazy = true,

    init = function()
      local setup_server = function(server, opts)
        local lspconfig = require('lspconfig')
        if opts == nil then
          opts = {}
        end
        opts.on_attach = opts.on_attach or LM.lsp.on_attach.on_attach
        opts.capabilities = opts.capabilities or LM.lsp.capabilities
        lspconfig[server].setup(opts)
      end

      LM.lsp.setup_server = setup_server
    end,
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_installation = true,
      })

      --      local lspconfig = require('lspconfig')


      LM.lsp.setup_server('lua_ls', {
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

      LM.lsp.setup_server('clangd', {
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

      LM.lsp.setup_server('pylsp')
      -- to install also mypy run ':PylspInstall pyls-flake8 pylsp-mypy pyls-isort'
      LM.lsp.on_attach.add_on_attach_function(function(client, bufnr)
        vim.keymap.set('n', '<leader>li', '<cmd>PylspInstall pylsp-mypy pyls-isort<cr>',
          { buffer = bufnr, desc = "Install mypy" })
      end, 'python')


      LM.lsp.setup_server('powershell_es')
    end
  }
}
