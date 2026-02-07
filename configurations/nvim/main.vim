" ------------------------------------------------------------------------------
"                                   SETTINGS
" ------------------------------------------------------------------------------

" ------------------------------
" --- buffer and text
" ------------------------------
set colorcolumn=0          " column to highlight (0 to disable)
set conceallevel=0
set foldmethod=expr        " use treesitter based folding, "manual" otherwise
set foldexpr=              " set to "nvim_treesitter#foldexpr()" for treesitter based folding
set foldlevelstart=99
set hidden                 " required to keep multiple buffers and open multiple buffers
set signcolumn=auto        " show the sign column only if needed
set smartindent
set showmatch
set nowrap                 " display lines as one long line
set termguicolors          " set term gui colors (most terminals support this)
set fillchars+=eob:\       " EOF indicator
" ------------------------------
" --- clipboard
" ------------------------------
set clipboard=unnamedplus  " system clipboard by default

" ------------------------------
" --- command line
" ------------------------------
set cmdheight=1            " height of the commandline

" ------------------------------
" --- completion
" ------------------------------
set pumheight=10
set updatetime=100         " for faster completion
set completeopt=menu,menuone,noselect
if has('nvim-0.11')
  set completeopt+=fuzzy   " Use fuzzy matching for built-in completion
endif
set omnifunc=ccomplete#Complete

" ------------------------------
" --- cursor
" ------------------------------
set nocursorline           " highlight the current line
set virtualedit=onemore    " let the cursor go one char after the end of the line

" ------------------------------
" --- file encoding
" ------------------------------
set fileencoding=utf-8

" ------------------------------
" --- junk files
" ------------------------------
set nobackup               " no backup files
set noswapfile             " no swapfiles
set undofile               " save undos
set nowritebackup          " safety check for concurrent editing

" ------------------------------
" --- line number
" ------------------------------
set number                 " show line numbers
set relativenumber         " show relative line numbers
set numberwidth=4          " set number column width

if has('nvim')
  augroup TerminalSettings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
endif

" ------------------------------
" --- searching
" ------------------------------
set hlsearch               " highlight all matches on previous search pattern
set ignorecase             " ignore case in search patterns
set matchpairs+=<:>
set smartcase
set path=** " used for find files in current path with :find
set wildignore+=*/.git/*

" ------------------------------
" --- tab spaces
" ------------------------------
set expandtab              " convert tabs to spaces
set shiftwidth=2           " the number of spaces inserted for each indentation
set tabstop=2              " insert 2 spaces for a tab

" ------------------------------
" --- windows and scrolling
" ------------------------------
" set scrolloff=8
" set sidescrolloff=8
set laststatus=3           " only a statusline for all windows
set splitbelow             " force horizontal splits to go below
set splitright             " force vertical splits to go to the right
set title                  " modify the window title
set titlestring=%t         " set the window title to the buffer name
set noshowmode             " hide current mode in statusbar
set showtabline=1
if has('nvim')
  set winborder=single
endif

" ------------------------------
" --- behaviour
" ------------------------------
set exrc                   " automatically load .nvim.lua / .vimrc in root folder
let &packpath ..= ',' .. getcwd() .. '/.nvim' " add the .nvim local folder to paths
set mouse=a                " allow the mouse to be used
set timeoutlen=500         " time to wait for mapped sequence

" ------------------------------
" --- Windows options
" ------------------------------
set nofsync


" ------------------------------------------------------------------------------
"                                   KEYMAPS
" ------------------------------------------------------------------------------

" LEADER
let mapleader = " "

" ------------------------------------- NORMAL ----------------------------------

" QUIT
nnoremap <leader>qq <cmd>qa!<cr>
map <c-z> <Nop>

" EDIT
nnoremap gh 0
nnoremap gl $

" VARIOUS
nnoremap <C-s> <cmd>w<cr>
nnoremap <C-g> <Esc>
nnoremap U :redo<cr>
nnoremap <tab> ==
nnoremap <leader><leader> :
nnoremap <leader>' :make 
nnoremap <C-'> :make 

" WINDOWS
nnoremap <m-ScrollWheelUp> zhzh
nnoremap <m-ScrollWheelDown> zlzl
nnoremap <C-Up> :resize +2<cr>
nnoremap <C-Down> :resize -2<cr>
nnoremap <C-Left> :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>

" BUFFERS
nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>
nnoremap <leader>bf <cmd>lua require('core.utils').format_buffer()<cr>
nnoremap <leader>bd <cmd>lua require('core.utils').delete_buffer()<cr>

" SEARCHING
nnoremap <leader>ff :find 
nnoremap <leader>fh <cmd>nohl<cr>
nnoremap <C-h> <cmd>nohl<cr>

" EMACSY / MISC
nnoremap <M-x> :lua 
nnoremap <C-c> tn <cmd>tabnew<cr>
nnoremap <C-c> t0 <cmd>tabclose<cr>

" ------------------------------------- INSERT ----------------------------------

" dumb autopair
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i

" utility
inoremap <C-g> <Esc>
inoremap <C-ì> <C-k>'?
inoremap <C-'> <C-k>'!
inoremap <s-cr> <c-o>O
inoremap <c-cr> <c-o>o

" ------------------------------------- VISUAL ----------------------------------

" <C-g> as Escape
xnoremap <C-g> <Esc>

" Moving text
xnoremap <A-j> :m .+1<CR>==
xnoremap <A-k> :m .-2<CR>==
xnoremap p "_dP

" Moving blocks
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv
xnoremap <A-j> :move '>+1<CR>gv-gv
xnoremap <A-k> :move '<-2<CR>gv-gv

" Indenting
xnoremap <tab> =

" ---------------------------------- COMMAND LINE -------------------------------

cnoremap <C-g> <Esc>
cnoremap <C-ì> <C-k>'?
cnoremap <C-'> <C-k>'!

" ------------------------------------- TERMINAL --------------------------------

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" Italian keyboard utility
tnoremap <c-ì> ~
tnoremap <c-'> `


" ------------------------------ VIM ONLY SETTINGS -------------------------------
if !has('nvim')
  syntax on
endif
