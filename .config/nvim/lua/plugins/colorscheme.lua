return {
    {
        "eduardomillanrs/kanso.nvim",
        lazy     = false,
        priority = 1000,
        opts     = {
            bold           = true,
            italics        = true,
            compile        = false,
            undercurl      = true,
            commentStyle   = { italic = true },
            functionStyle  = { italic = true },
            keywordStyle   = {},
            statementStyle = {},
            typeStyle      = { bold = true },
            transparent    = false,
            dimInactive    = false,
            terminalColors = true,
            colors         = {
                palette = {},
            },
            overrides      = function (colors)
                return {}
            end,
            theme          = "zen",
            background     = {
                dark  = "zen",
                light = "pearl"
            },
        },
        init     = function ()
            vim.cmd.colorscheme("kanso")
        end
    },
}
