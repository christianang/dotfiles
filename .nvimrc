set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'eiginn/netrw'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-jdaddy'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Leader key
let mapleader = ","

" Syntax highlighting
syntax on

" Setup line numbers, spacing and indenting
set number
set tabstop=2 shiftwidth=2 expandtab
set ts=2
set nowrap
set backspace=2

" Clipboard works with yank buffer
set clipboard+=unnamedplus

" Enable vim stuff
set hlsearch
set autoread
set smartcase
set history=1024
set showmatch
set incsearch
set hidden
set wildmenu
set wildmode=list:longest,full
set lazyredraw

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Show trailing whitespace
set listchars=tab:\ \ ,trail:█
set list

" Write all writable buffers when changing buffers or losing focus
" Fix fo escape key delay
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

" search will center on the line it's found in
nnoremap n nzzzv
nnoremap N Nzzzv

" Turn backup off
set nobackup
set nowb
set noswapfile

" highlight specials characters and trailing whitespace
highlight NonText guifg=#444444 ctermfg=238
highlight SpecialKey guifg=#FF00AF ctermfg=199

" show column highlight for long lines
highlight ColorColumn guibg=#262626 ctermbg=255
call matchadd('ColorColumn', '\%81v', 100)

" colorscheme
let base16colorspace=256
colorscheme base16-default-dark

" Highlight Matching Paren
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" Airline settings
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1

" Nerdcommenter settings
filetype plugin indent on
let g:NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

" Ack.vim settings
let g:ackprg = 'ag --vimgrep'

" vim-go settings
let g:go_fmt_command = 'goimports'
let g:godef_split = 3
let g:go_autodetect_gopath = 0
let g:go_term_enabled = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Autocommands
if has('autocmd')
  " Golang settings
  autocmd FileType go set tabstop=4 shiftwidth=4 noexpandtab
  " open import path at godoc.org
  autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  " switch between implementation and test files
  autocmd FileType go nmap <Leader>a :vsp<CR>:GoAlternate<CR>
  " run tests
  autocmd FileType go nnoremap <leader>t :GoTest<cr>
  " run code
  autocmd FileType go nnoremap <Leader>r <Plug>(go-run)
  " Ruby settings
  autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab
  " YAML
  autocmd FileType yaml setlocal indentexpr=
  " JSON
  " autocmd FileType json autocmd BufWritePre <buffer> :normal gqaj
  " Save anytime we leave a buffer or MacVim loses focus.
  autocmd BufLeave,FocusLost * silent! wall
  augroup vimrcEx
    " Clear all autocmds in this group
    autocmd!
    " Keep cursor position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END
endif

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
