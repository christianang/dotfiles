return {
    {
        -- trailing whitespace
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g.strip_whitespace_on_save      = 1
            vim.g.show_spaces_that_precede_tabs = 1
            vim.g.strip_whitespace_confirm      = 0
        end
    },
    {
        -- comment
        'numToStr/Comment.nvim'
    },
    {
        -- multi-visual
        "mg979/vim-visual-multi"
    },
    {
        -- visual git
        'tanvirtin/vgit.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { "tpope/vim-fugitive" },
    { "tpope/vim-jdaddy" },
}