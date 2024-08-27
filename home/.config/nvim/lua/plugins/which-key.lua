vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.setup {}

wk.register({
    {
        { "<leader>f",  group = "find" },
        { "<leader>fb", desc = "Buffer" },
        { "<leader>ff", desc = "Files" },
        { "<leader>fg", desc = "Grep" },
        { "<leader>fh", desc = "Help Tags" },
    }
})
