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
set nowrap
set hidden
set splitright
set ignorecase
set smartcase

" Lsp Diagnostic Signs
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=

" Keyboard Bindings
nnoremap <silent> - :edit %:p:h<cr>

inoremap <S-Tab> <C-d>
