-- Mimic behavior from D, C
vim.keymap.set('n', 'Y', 'y$')

-- Copy to system clipboard
vim.keymap.set('v', 'Y', '"+y')

-- Indent/un-indent
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')

-- Escape to clear search
vim.keymap.set('n', '<esc>', ':noh<cr>', { silent = true })

-- Diagnostics
-- vim.keymap.set('n', '<M-p>', [[:Lspsaga diagnostic_jump_prev<cr>]], { silent = true })
-- vim.keymap.set('n', '<M-n>', [[:Lspsaga diagnostic_jump_next<cr>]], { silent = true })

-- Telescope
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})

-- Trouble
vim.keymap.set("n", "<leader>e", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

-- Save on enter
vim.keymap.set('n', '<CR>', function()
    if vim.api.nvim_eval([[&modified]]) ~= 1 or vim.api.nvim_eval([[&buftype]]) ~= '' then
        return nil
    end
    vim.schedule(function() vim.cmd("write") end)
end, { expr = true })
