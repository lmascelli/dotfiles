local M = {}
M.url = "neoclide/coc.nvim"
M.lazy = true
M.event = "VeryLazy"
M.branch = "release"
M.init = function()
  LM.coc_toggle = function()
    if vim.g.coc_service_initialized == 0 then
      vim.cmd 'CocStart'
    else
      if vim.g.coc_enabled == 0 then
        vim.cmd 'CocEnable'
      else
        vim.cmd 'CocDisable'
      end
    end
  end

  LM.complete = function()
    vim.fn["coc#refresh"]()
  end

  vim.g.coc_start_at_startup = false;
  local keymap = LM.keymaps.add_map
  keymap('n', '<leader>l', "", nil, nil, "lsp")
  keymap('n', '<leader>lg', "", nil, nil, "go to")
  keymap('n', '<leader>lc', "", nil, nil, "code action")
  keymap('n', '<leader>ll', '<cmd>lua LM.coc_toggle()<cr>', nil, nil, "enable")
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

M.config = function ()
  vim.cmd [[
  inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
  ]]
end
return M