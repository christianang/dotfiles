filetype plugin indent on

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

" yank to clipboard alias
vnoremap <leader>y "*y

" yank to clipboard alias
nnoremap <leader>p "*p
vnoremap <leader>p "*p

" Enable > indent and < unindent
vnoremap <silent> > >gv
vnoremap <silent> < <gv

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
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Highlight Matching Paren
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" Nerdcommenter settings
filetype plugin indent on
let g:NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

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
  " compile code
  autocmd FileType go nnoremap <leader>c :GoTestCompile<cr>
  " run code
  autocmd FileType go nnoremap <Leader>r <Plug>(go-run)
  " Ruby settings
  autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab
  " YAML
  autocmd FileType yaml setlocal indentexpr=
  autocmd FileType yaml set tabstop=2 shiftwidth=2 expandtab
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
