LM.plugins.with_lsp = true

return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
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

      -- clangd
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

      -- lua_ls
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

      -- pylsp
      setup_server('pylsp',
        {
          plugins = {
            ruff = {
              enabled = true,                  -- Enable the plugin
              formatEnabled = true,            -- Enable formatting using ruffs formatter
              executable = "ruff",             -- Custom path to ruff
              -- config = "<path_to_custom_ruff_toml>", -- Custom config for ruff to use
              extendSelect = { "I" },          -- Rules that are additionally used by ruff
              extendIgnore = { "C90" },        -- Rules that are additionally ignored by ruff
              format = { "I" },                -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
              severities = { ["D212"] = "I" }, -- Optional table of rules where a custom severity is desired
              unsafeFixes = false,             -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

              -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
              lineLength = 88,                                 -- Line length to pass to ruff checking and formatting
              exclude = { "__about__.py" },                    -- Files to be excluded by ruff checking
              select = { "F" },                                -- Rules to be enabled by ruff
              ignore = { "D210" },                             -- Rules to be ignored by ruff
              perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
              preview = false,                                 -- Whether to enable the preview style linting and formatting.
              targetVersion = "py310",                         -- The minimum python version to target (applies for both linting and formatting).
            },
            black = { enabled = true },
            autopep8 = { enabled = false },
            yapf = { enabled = false },

            pylint = { enabled = false, executable = "pylint" },
          }
        })

      -- to install also mypy run ':PylspInstall pyls-flake8 pylsp-mypy pyls-isort'
      LM.lsp.on_attach.add_on_attach_function(function(_, bufnr)
        vim.keymap.set('n', '<leader>li', '<cmd>PylspInstall pylsp-mypy pyls-isort<cr>',
          { buffer = bufnr, desc = "Install mypy" })
      end, 'python')

      -- ruff
      setup_server('ruff', {
        init_options = {
          settings = {

          }
        }
      })

      -- rust_analyzer
      setup_server('rust_analyzer', {
        settings = {
          cargo = {
            -- allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          ["rust-analyzer"] = {
            -- checkOnSave = {
            --   -- allFeatures = true,
            --   command = "clippy",
            --   extraArgs = {
            --     "--",
            --     "--no-deps",
            --     -- "-Dclippy::correctness",
            --     -- "-Dclippy::complexity",
            --     -- "-Wclippy::perf",
            --     -- "-Wclippy::pedantic",
            --   }
            -- }
          }
        }
      })

    end,
  },
}
