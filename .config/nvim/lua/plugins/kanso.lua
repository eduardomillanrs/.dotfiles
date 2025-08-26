return {
    "eduardomillanrs/kanso.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {
        bold           = true,
        italics        = true,
        compile        = false,
        undercurl      = true,
        commentStyle   = { italic = true, bold = false },
        functionStyle  = { italic = true, bold = false },
        keywordStyle   = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle      = { italic = false, bold = false },
        transparent    = false,
        dimInactive    = false,
        terminalColors = true,
        colors         = {
            palette = {},
        },
        overrides      = function ()
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
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#06090d", fg = "#c5c9c7" })
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#06090d" })
    end
}
