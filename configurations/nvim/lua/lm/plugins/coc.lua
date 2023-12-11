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
    vim.keymap.set('n', '<leader>ll', '<cmd>lua LM.coc_toggle()<cr>', { desc = "enable" })
  end,
  config = function()
    LM.api.complete = function()
      vim.fn.eval("coc#refresh()")
    end

    LM.api.toggle_explorer = function()
      vim.cmd 'CocCommand explorer'
    end

    vim.keymap.set('n', '<leader>ff', '<cmd>CocList files<cr>', { desc = "enable" })
    vim.keymap.set('n', '<leader>fg', '<cmd>CocList grep<cr>', { desc = "enable" })
    vim.keymap.set('n', '<leader>bl', '<cmd>CocList buffers<cr>', { desc = "enable" })
    vim.keymap.set('i', '<c-x><c-o>', 'coc#refresh()', { silent = true, expr = true })
    vim.keymap.set('n', '<leader>lk', '<cmd>lua _G.show_docs()<cr>', { desc = "documentation", silent = true })
    -- <space>gs --> Signature
    vim.keymap.set('n', '<leader>ls', '<cmd>eval CocActionAsync("showSignatureHelp")<cr>', { desc = "signature" })
    vim.keymap.set('i', '<c-l>', '<cmd>eval CocActionAsync("showSignatureHelp")<cr>', { desc = "signature" })
    -- <space>gf --> Format document
    vim.keymap.set('n', '<leader>lf', '<cmd>eval CocActionAsync("format")<cr>', { desc = "format", silent = true })
    --    -- <space>gr --> Refactor
    vim.keymap.set('n', '<leader>lr', '<Plug>(coc-rename)', { desc = "rename", silent = true })
    -- <space>ge --> Definition
    vim.keymap.set('n', '<leader>lgd', '<Plug>(coc-definition)', { desc = "definition" })
    vim.keymap.set('n', '<leader>lgy', '<Plug>(coc-type-definition)', { desc = "type definition" })
    vim.keymap.set('n', '<leader>lgi', '<Plug>(coc-implementation)', { desc = "implementation" })
    vim.keymap.set('n', '<leader>lgr', '<Plug>(coc-reference)', { desc = "reference" })
    -- <space>ge --> Diagnostics
    vim.keymap.set('n', '<leader>ld', '<cmd>CocDiagnostics<cr>', { desc = "diagnostics" })
    vim.keymap.set('n', '<leader>lgp', '<Plug>(coc-diagnostic-prev)', { desc = "previous error" })
    vim.keymap.set('n', '<leader>lgn', '<Plug>(coc-diagnostic-next)', { desc = "next error" })
    -- <space>g. --> Fix
    vim.keymap.set('n', '<leader>la', '<Plug>(coc-fix-current)', { desc = "code action", silent = true, nowait = true })
    vim.keymap.set('n', "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"',
      { silent = true, nowait = true, expr = true })
    vim.keymap.set('n', "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"',
      { silent = true, nowait = true, expr = true })
    vim.keymap.set('i', '<cr>',
      [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {
        silent = true,
        noremap = true,
        expr = true,
        replace_keycodes = false,
      })
    vim.keymap.set('i', '<TAB>',
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {
        silent = true,
        noremap = true,
        expr = true,
        replace_keycodes = false,
      })
    vim.keymap.set('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {
      silent = true,
      noremap = true,
      expr = true,
      replace_keycodes = false,
    })
    vim.keymap.set('i', '<c-j>',
      "<Plug>(coc-snippets-expand-jump)", {
        silent = true,
        noremap = true,
        expr = true,
        replace_keycodes = false,
      })
    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
      else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end
  end,
}
