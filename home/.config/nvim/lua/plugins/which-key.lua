vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.setup {}

wk.register({
    f = {
        name = "find",
        f = "Files",
        g = "Grep",
        b = "Buffer",
        h = "Help Tags",
    },
}, { prefix = "<leader>" })
