local M = {}
M.name = 'nvim-cmp'
M.url = 'hrsh7th/nvim-cmp'
M.lazy = true
M.event  = { "BufNewFile", "BufReadPost" }
M.requires = {
  { url = 'hrsh7th/cmp-nvim-lsp', },
  { url = 'hrsh7th/cmp-nvim-lsp-document-symbol', },
  { url = 'hrsh7th/cmp-buffer', },
  { url = 'hrsh7th/cmp-path', },
  { url = 'hrsh7th/cmp-cmdline', },
  { url = 'L3MON4D3/LuaSnip', },
  { url = 'saadparwaiz1/cmp_luasnip', },
}

M.config = function()
  local ok, cmp = pcall(require, 'cmp')
  if ok then
    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-ò>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })
  end
end

M.init = function()
  LM.keymaps.add_map('i', '<c-x><c-o>', '<cmd>lua require("cmp").complete()', { noremap = false })
end

return M
