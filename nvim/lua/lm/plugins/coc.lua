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

  local keys = vim.api.nvim_replace_termcodes('<c-x><c-o>', true, false, true)

  LM.complete = function()
    vim.api.nvim_feedkeys(keys, 'i', false)
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
  local keymap = LM.keymaps.add_map
  local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
  keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', ops, nil, nil)
  function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end
end
return M
