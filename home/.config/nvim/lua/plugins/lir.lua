local actions = require('lir.actions')
local mark_actions = require('lir.mark.actions')
local clipboard_actions = require('lir.clipboard.actions')

require('lir').setup {
    show_hidden_files = true,
    devicons = {
        enable = true
    },
    mappings = {
        ['<cr>']  = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,
        ['-']     = actions.up,
        ['q']     = actions.quit,
        ['<Esc>'] = actions.quit,
        ['K']     = actions.mkdir,
        ['N']     = actions.newfile,
        ['R']     = actions.rename,
        ['@']     = actions.cd,
        ['Y']     = actions.yank_path,
        ['.']     = actions.toggle_show_hidden,
        ['D']     = actions.delete,
        ['J']     = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['C']     = clipboard_actions.copy,
        ['X']     = clipboard_actions.cut,
        ['P']     = clipboard_actions.paste,
    }
}

vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { "lir" },
    callback = function()
        -- use visual mode
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
        )

        -- echo cwd
        vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
    end
})

require('lir.git_status').setup {}

-- Override lir key binding to open in current pane and not float
vim.api.nvim_set_keymap('n', '-', [[:edit %:p:h<cr>]], { noremap = true, silent = true })
