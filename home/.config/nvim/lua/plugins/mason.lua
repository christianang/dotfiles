require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "lua_ls", "pyright", "golangci_lint_ls" }
}

local null_ls = require("null-ls")
null_ls.setup({
    sources = { null_ls.builtins.diagnostics.golangci_lint },
})
require("lsp-format").setup {}
require("telescope").setup {}
local builtin = require('telescope.builtin')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- auto format
    require("lsp-format").on_attach(client)
end

require("lspconfig").gopls.setup { capabilities = capabilities, on_attach = on_attach }
require("lspconfig").lua_ls.setup { capabilities = capabilities, on_attach = on_attach }
require("lspconfig").pyright.setup { capabilities = capabilities, on_attach = on_attach }
require("lspconfig").ruby_ls.setup { capabilities = capabilities, on_attach = on_attach }
