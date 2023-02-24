local packer = require 'packer'

local install = function()
    packer.use { 'neoclide/coc.nvim', branch = 'release', }
end

local config = function()

    vim.cmd 'highlight CocFloating ctermbg=16'
    vim.cmd 'highlight CocFloating ctermfg=White'
    vim.cmd 'highlight CocErrorFloat ctermbg=1 ctermfg=3'

    vim.g.coc_global_extensions = {
 'coc-json',
 'coc-lua',
 'coc-pyright',
 'coc-pairs',
 'coc-cmake',
 'coc-clangd',
 'coc-sumneko-lua',
 'coc-powershell',
 'coc-snippets',
    }

    vim.g.show_documentation = function()
        vim.cmd [[
  if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
  call CocActionAsync('doHover')
  else
  execute '!' . &keywordprg . " " . expand('<cword>')
  endif
  ]]
    end

    -- ***********   CoC keymap   ***************
    --
    --    CoC-LSP
    --
    -- <space>gk -> Documentation

    local keymap = vim.api.nvim_set_keymap

    keymap('n', 'K', 'CocActionAsync("doHover")', {
  silent = true,
  nowait = true,
  expr = true,
    })
    -- <space>gs --> Signature
    keymap('i', '<c-l>', '<c-r>=CocActionAsync("showSignatureHelp")<cr>', {
  silent = true,
  nowait = true,
    })
    -- <c-x><c-o> --> Show completion
    keymap('i', '<c-x><c-o>', 'coc#refresh()', {
  silent = true,
  expr = true,
    })
    -- <space>gf --> Format document
    keymap('n', '<leader>gf', '<cmd>CocCommand editor.action.formatDocument<cr>', {})
    -- <space>gr --> Refactor
    keymap('n', '<leader>gr', '<Plug>(coc-rename)', {})
    -- <space>ge --> Definition
    keymap('n', '<leader>ge', '<Plug>(coc-definition)', {})
    -- <space>ge --> Diagnostics
    keymap('n', '<leader>gp', '<cmd>CocList diagnostics<cr>', {})
    -- <space>g. --> Fix
    keymap('n', '<leader>g.', '<cmd>CocFix<cr>', {})
end


return {
  install = install,
  config = config,
}
