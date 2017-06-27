set nocompatible              " be iMproved, required
filetype plugin indent on    " required

" Enable line numbers
" 	and syntax highlighting
set number
syntax on

" Do not add double space after .,?,! when using J or gq
set nojoinspaces

" Smart case search
" Use \c or \C in search pattern to override
set ignorecase
set smartcase

" Highlight searches
set hlsearch
" Clear highlight when pressing <esc> in normal mode
nnoremap <silent> <esc> :noh<cr> <esc>
nnoremap <esc>^[ <esc>^[

" Show filename in window title
set title

" Set path so that files can be found in subdirs
set path+=**

" Set different cursors for different modes
let &t_SI = "\<Esc>[6 q"	" IBeam for insert mode
let &t_EI = "\<Esc>[2 q"	" Block for normal mode
if v:version > 704 || v:version == 704 && has('patch687')
	let &t_SR = "\<Esc>[4 q"	" Underline for replace mode
endif

" Enable mouse in all modes
set mouse=a

" Reduce delay on returning to normal mode from insert mode
set ttimeoutlen=10

" Fix for some .tex files being detected as 'plaintex'
let g:tex_flavor = 'latex'
" Spell check TeX files
autocmd FileType tex setlocal spell spelllang=en_gb
nnoremap <silent> <F2> :call ToggleAutoformat()<CR>
inoremap <silent> <F2> <ESC>:call ToggleAutoformat()<CR>a
function! ToggleAutoformat()
  if &formatoptions =~ 'a'
    setlocal formatoptions-=a
    "echo "Auto-format disabled"
  else
    setlocal formatoptions+=a
    "echo "Auto-format enabled"
  endif
endfunction

" Swap mapping of ; and :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Map C-{h,j,k,l} for window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" More scrolling with <C-e>, <C-y>
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" Folding with spacebar
set foldmethod=indent
set foldlevelstart=99	" Prevent folds closing on file open
nnoremap <space> za

" Session options
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Show status line always on separate line
set laststatus=2
