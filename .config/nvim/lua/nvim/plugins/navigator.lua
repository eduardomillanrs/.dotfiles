return {
    "numToStr/Navigator.nvim",
    keys = {
        {
            "<C-w>h",
            "<CMD>NavigatorLeft<CR>",
            desc = "NavigatorLeft",
            silent = true,
            mode = { "n" },
        },
        {
            "<C-w>l",
            "<CMD>NavigatorRight<CR>",
            desc = "NavigatorRight",
            silent = true,
            mode = { "n" },
        },
        {
            "<C-w>k",
            "<CMD>NavigatorUp<CR>",
            desc = "NavigatorUp",
            silent = true,
            mode = { "n" },
        },
        {
            "<C-w>j",
            "<CMD>NavigatorDown<CR>",
            desc = "NavigatorDown",
            silent = true,
            mode = { "n" },
        },
    },
    config = function ()
        local navigator = require("Navigator")

        -- Setup
        navigator.setup()
    end,
}
