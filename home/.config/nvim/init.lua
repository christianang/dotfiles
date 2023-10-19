local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function() require('plugins.treesitter') end,
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- theme
    use {
        'navarasu/onedark.nvim',
        config = function() require('plugins/onedark') end,
    }

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require('plugins/lualine') end,
    }

    -- trailing whitespace
    use {
        'ntpeters/vim-better-whitespace',
        config = function() require('plugins/vim-better-whitespace') end,
    }

    -- file explorer
    use {
        'tamago324/lir.nvim',
        requires = {
            'tamago324/lir-git-status.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require('plugins/lir') end,
    }

    -- lsp
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function() require('plugins/mason') end,
    }

    -- go.nvim
    use {
        'ray-x/go.nvim',
        run = ":GoInstallBinaries",
        config = function() require('plugins/golang') end,
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        config = function() require('plugins/telescope') end,
    }

    -- completions
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-calc",
        },
        config = function() require('plugins/completion') end,
    }

    -- comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- auto-format
    use "lukas-reineke/lsp-format.nvim"

    -- multi-visual
    use "mg979/vim-visual-multi"

    -- which-key
    use {
        "folke/which-key.nvim",
        config = function() require('plugins/which-key') end,
    }

    -- indentation guide
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('plugins/indent-blankline') end,
    }

    -- visual git
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require('vgit').setup() end,
    }

    -- trouble
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }

    -- vim-fugitive
    use "tpope/vim-fugitive"
    use "tpope/vim-jdaddy"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('plugins/general')
require('plugins/keyboard')
