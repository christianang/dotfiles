vim.g.mapleader          = ' '
vim.g.loaded_netrwPlugin = 1

vim.opt.showmatch        = true -- Show matching brackets/parentthesis
vim.opt.splitright       = true -- Vertical splits to the right
vim.opt.ignorecase       = true -- Case insensitive search
vim.opt.smartcase        = true -- ... but case sensitive when uc present

vim.wo.number            = true
vim.wo.wrap              = false

-- Indentation
vim.opt.expandtab        = true -- Tabs are spaces, not tabs
vim.opt.shiftwidth       = 4    -- Use indents of 2 spaces
vim.opt.softtabstop      = 4    -- Let backspace delete indent
vim.opt.tabstop          = 4    -- An indentation every four columns

-- Undo
vim.opt.undofile         = true  -- Persistent undo
vim.opt.undolevels       = 1000  -- Maximum number of changes that can be undone
vim.opt.undoreload       = 10000 -- Maximum number lines to save for undo on a buffer reload

-- Folding
vim.opt.foldlevel        = 20
vim.opt.foldmethod       = 'expr'
vim.opt.foldexpr         = 'nvim_treesitter#foldexpr()'

-- Recommended vgit settings
vim.o.updatetime         = 300
vim.o.incsearch          = false
vim.wo.signcolumn        = 'yes'
