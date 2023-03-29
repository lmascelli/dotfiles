local M = {}


M.url = 'rafamadriz/friendly-snippets'
M.requires = {
  { url = 'L3MON4D3/LuaSnip' },
}
M.config = function()
  require("luasnip.loaders.from_vscode").lazy_load()
  require 'luasnip'

  vim.cmd [[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
    ]]
end

return M
