local M = {}

local cmp_dependencies = {
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'quangnguyen30192/cmp-nvim-tags',
}

if LM.plugins.with_lsp then
  table.insert(cmp_dependencies, 'neovim/nvim-lspconfig')
  table.insert(cmp_dependencies, 'hrsh7th/cmp-nvim-lsp')
  table.insert(cmp_dependencies, 'hrsh7th/cmp-nvim-lsp-signature-help')
end

local cmp_sources = {
  {
    name = 'buffer',
    option = {
      get_bufnrs = function()
        return vim.api.nvim_list_bufs()
      end
    },
  },
  { name = 'path', },
  { name = 'luasnip' },
  { name = 'tags',
    option = {
      -- this is the default options, change them if you want.
      -- Delayed time after user input, in milliseconds.
      complete_defer = 100,
      -- Max items when searching `taglist`.
      max_items = 10,
      -- The number of characters that need to be typed to trigger
      -- auto-completion.
      keyword_length = 3,
      -- Use exact word match when searching `taglist`, for better searching
      -- performance.
      exact_match = false,
      -- Prioritize searching result for current buffer.
      current_buffer_only = false,
    },
  }
}

if LM.plugins.with_lsp then
  table.insert(cmp_sources, 1, { name = 'nvim_lsp_signature_help' })
  table.insert(cmp_sources, 1, { name = 'nvim_lsp' })
end

local cmp = {
  'hrsh7th/nvim-cmp',
  dependencies = cmp_dependencies,
  lazy = true,
  event = { 'BufRead', 'InsertEnter' },
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      preselect = cmp.PreselectMode.None,
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        --        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = function(fallback)
          if cmp.get_active_entry() then
            cmp.confirm()
          else
            fallback()
          end
        end,
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
      }),
      sources = cmp.config.sources(cmp_sources)
    })

    if LM.plugins.with_lsp then
      LM.lsp.capabilities = require('cmp_nvim_lsp').default_capabilities()
    end

    LM.complete = function()
      cmp.complete()
    end
  end
}

table.insert(M, cmp)
return M
