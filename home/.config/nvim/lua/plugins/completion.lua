-- Set up nvim-cmp.
local cmp = require('cmp')

local next = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"]() == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
end, { "i", "s" })

local prev = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
    end
end, { "i", "s" })

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = next,
        ['<C-n>'] = next,
        ["<S-Tab>"] = prev,
        ["<C-p>"] = prev,
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Enter>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
