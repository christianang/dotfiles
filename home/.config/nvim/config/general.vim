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

" Ultest Signs
let g:ultest_pass_sign = ''
let g:ultest_fail_sign = ''
let g:ultest_running_sign = ''
let g:ultest_not_run_sign = ''

" Keyboard Bindings
nnoremap <silent> - :edit %:p:h<cr>
nnoremap <silent> <C-p> <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <silent> <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

inoremap <S-Tab> <C-d>
