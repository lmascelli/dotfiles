lua << EOF
pcall(vim.cmd, 'GuiLoad')
vim.api.nvim_set_keymap('i', '<C-Space>', '<cmd>:lua LM.complete()<cr>', {})

if vim.fn.exists(':GuiFont') then
  LM.font.update_font = function()
    vim.cmd(':GuiFont! ' .. LM.font.font_name .. ':h' .. LM.font.font_size)
  end
end
EOF

" Set Guifont
if exists(':GuiFont')
  :lua LM.font.update_font()
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" if exists(':GuiRenderLigatures')
"     GuiRenderLigatures 1
" endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

autocmd FocusGained * :checktime
