return {
    {
        -- "eduardomillanrs/kanso.nvim",
        dir      = "~/Projects/kanso.nvim",
        lazy     = false,
        priority = 1000,
        opts     = {
            bold           = false,
            italics        = false,
            compile        = false,
            undercurl      = true,
            commentStyle   = {},
            functionStyle  = {},
            keywordStyle   = {},
            statementStyle = {},
            typeStyle      = {},
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
