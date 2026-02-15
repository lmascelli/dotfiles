""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                                  SETTINGS                                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ------------------------------
" buffer and text
" ------------------------------
syntax on
set nohidden
set smartindent
set showmatch
set nowrap
set termguicolors
set fillchars+=eob:\ 
set fileencoding=utf-8
set expandtab
set shiftwidth=2
set tabstop=2

" ------------------------------
" clipboard
" ------------------------------
set clipboard+=unnamedplus

" ------------------------------
" command line 
" ------------------------------
set cmdheight=1

" ------------------------------
" searching
" ------------------------------
set hlsearch
set ignorecase
set smartcase


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                                   KEYMAPS                                    "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" dumb autopair
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
