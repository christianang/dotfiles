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

" Keyboard Bindings
nnoremap <silent> - :edit %:p:h<cr>
