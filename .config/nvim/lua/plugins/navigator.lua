return {
    "numToStr/Navigator.nvim",
    keys   = {
        {
            "<C-w>h",
            "<CMD>NavigatorLeft<CR>",
            mode   = { "n" },
            desc   = "NavigatorLeft",
            silent = true,
        },
        {
            "<C-w>l",
            "<CMD>NavigatorRight<CR>",
            mode   = { "n" },
            desc   = "NavigatorRight",
            silent = true,
        },
        {
            "<C-w>k",
            "<CMD>NavigatorUp<CR>",
            mode   = { "n" },
            desc   = "NavigatorUp",
            silent = true,
        },
        {
            "<C-w>j",
            "<CMD>NavigatorDown<CR>",
            mode   = { "n" },
            desc   = "NavigatorDown",
            silent = true,
        },
    },
    config = true,
}
