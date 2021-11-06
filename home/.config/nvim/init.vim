call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'sainnhe/edge'

" Statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" File Explorer
Plug 'tamago324/lir.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tamago324/lir-git-status.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" More plugins
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'mg979/vim-visual-multi'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

call plug#end()

runtime! config/general.vim
" runtime! config/go.vim
" runtime! config/fzf.vim

runtime config/plugins/completions.lua
runtime config/plugins/lualine.lua
runtime config/plugins/lir.lua
runtime config/plugins/lsp_installer.lua
runtime config/plugins/gitsigns.lua
runtime config/plugins/indent_blankline.lua
