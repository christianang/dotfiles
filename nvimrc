runtime! config/preload.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-hclfmt'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'

call plug#end()

runtime! config/general.vim
runtime! config/go.vim
runtime! config/airline.vim
runtime! config/fzf.vim
runtime! config/omnisharp.vim
