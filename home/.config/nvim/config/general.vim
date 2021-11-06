" Leader key
let mapleader = ","

" Enable mouse
set mouse=a

" Edge colorscheme
if has('termguicolors')
  set termguicolors
endif

let g:edge_style = 'aura'

colorscheme edge

" General settings
set number
set completeopt=menu,menuone,noselect
set expandtab
set tabstop=4
set shiftwidth=4

" Keyboard Bindings
nnoremap <silent> - :edit %:p:h<cr>

inoremap <S-Tab> <C-d>
