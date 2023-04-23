local M = {}
M.url = "neoclide/coc.nvim"
M.lazy = true
M.event = "VeryLazy"
M.branch = "release"
M.init = function()
  local keymap = LM.keymaps.add_map
  keymap('n', '<leader>l', "", nil, nil, "lsp")
  keymap('n', '<leader>lg', "", nil, nil, "go to")
  keymap('n', '<leader>lc', "", nil, nil, "code action")
  vim.api.nvim_set_keymap('i', '<c-x><c-o>', 'coc#refresh()', {
    silent = true, expr = true })
  keymap('n', '<leader>lK', '<cmd>eval CocActionAsync("doHover")<cr>', nil,
    nil, "documentation")
  -- <space>gs --> Signature
  keymap('n', '<leader>lk', '<cmd>eval CocActionAsync("showSignatureHelp")<cr>',
    nil, nil, "signature")
  -- <space>gf --> Format document
  keymap('n', '<leader>lf', '<cmd>eval CocActionAsync("format")<cr>',
    nil, nil, "format")
  -- <space>gr --> Refactor
  keymap('n', '<leader>lcr', '<Plug>(coc-rename)', nil, nil, "refactor")
  -- <space>ge --> Definition
  keymap('n', '<leader>lgd', '<Plug>(coc-definition)', nil, nil, "definition")
  -- <space>ge --> Diagnostics
  keymap('n', '<leader>ld', '<cmd>CocList diagnostics<cr>', nil, nil, "diagnostics")
  -- <space>g. --> Fix
  keymap('n', '<leader>lca', '<cmd>CocFix<cr>', nil, nil, "code action")
end
return M
