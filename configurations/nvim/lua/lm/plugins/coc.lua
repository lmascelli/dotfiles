return {
  'neoclide/coc.nvim',
  branch = "release",
  init = function()
    vim.cmd [[
      let g:coc_global_extensions = ['coc-lists', 'coc-json', 'coc-pairs', 'coc-sumneko-lua', 'coc-clangd', 'coc-cmake', '@yaegassy/coc-pylsp']
    ]]
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
    -- vim.g.coc_start_at_startup = false;
    vim.keymap.set('n', '<leader>ff', '<cmd>CocList files<cr>', { desc = "enable" })
    vim.keymap.set('n', '<leader>fg', '<cmd>CocList grep<cr>', { desc = "enable" })
    vim.keymap.set('n', '<leader>bl', '<cmd>CocList buffers<cr>', { desc = "enable" })
    vim.keymap.set('n', '<leader>ll', '<cmd>lua LM.coc_toggle()<cr>', { desc = "enable" })
    vim.keymap.set('i', '<c-x><c-o>', 'coc#refresh()', { silent = true, expr = true })
    vim.keymap.set('n', '<leader>lK', '<cmd>eval CocActionAsync("doHover")<cr>', { desc = "documentation" })
    -- <space>gs --> Signature
    vim.keymap.set('n', '<leader>lk', '<cmd>eval CocActionAsync("showSignatureHelp")<cr>', { desc = "signature" })
    -- <space>gf --> Format document
    vim.keymap.set('n', '<leader>lf', '<cmd>eval CocActionAsync("format")<cr>', { desc = "format" })
    --    -- <space>gr --> Refactor
    vim.keymap.set('n', '<leader>lcr', '<Plug>(coc-rename)', { desc = "refactor" })
    -- <space>ge --> Definition
    vim.keymap.set('n', '<leader>lgd', '<Plug>(coc-definition)', { desc = "definition" })
    -- <space>ge --> Diagnostics
    vim.keymap.set('n', '<leader>ld', '<cmd>CocList diagnostics<cr>', { desc = "diagnostics" })
    -- <space>g. --> Fix
    vim.keymap.set('n', '<leader>lca', '<cmd>CocFix<cr>', { desc = "code action" })
  end,
  config = function()
    LM.api.complete = function()
      vim.cmd([[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]])
    end
    vim.keymap.set('i', '<TAB>',
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true })
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end
  end,
}
