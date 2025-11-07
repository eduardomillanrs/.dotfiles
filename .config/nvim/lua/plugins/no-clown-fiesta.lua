return {
    dir      = "~/Projects/no-clown-fiesta.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {
        theme       = "dark",
        transparent = false,
        styles      = {
            comments    = { italic = true },
            functions   = { italic = true },
            keywords    = {},
            lsp         = {},
            match_paren = {},
            type        = {},
            variables   = {},
        },
    },
    init     = function ()
        vim.cmd.colorscheme("no-clown-fiesta")
    end,
}
