return {
  "https://github.com/preservim/tagbar",
  cmd = 'TagbarToggle',
  lazy = true,
  init = function()
    vim.keymap.set('n', '<leader><f8>', '<cmd>TagbarToggle<cr>', { desc = 'Toggle Tagbar' })
  end,
  config = function()
    vim.cmd [[
      let g:tagbar_type_ps1 = {
          \ 'ctagstype': 'powershell',
          \ 'kinds': [
              \ 'e:enum',
              \ 'c:class',
              \ 'f:function',
              \ 'i:filter',
              \ 'v:variable'
          \ ]
      \ }
    ]]
  end
}
