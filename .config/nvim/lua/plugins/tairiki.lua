return {
    "deparr/tairiki.nvim",
    lazy     = false,
    priority = 1000,
    opts     = {
        palette              = "dark",
        default_dark         = "dark",
        default_light        = "light",
        transparent          = false,
        terminal             = false,
        end_of_buffer        = false,
        visual_bold          = false,
        cmp_itemkind_reverse = false,
        diagnostics          = {
            darker     = false,
            background = true,
            undercurl  = true,
        },
        code_style           = {
            comments     = { italic = true },
            conditionals = {},
            keywords     = {},
            functions    = { italic = true },
            strings      = {},
            variables    = {},
            parameters   = {},
            types        = {},
        },
        lualine              = {
            transparent = true,
        },
        plugins              = {
            auto = true,
        },
        colors               = function (colors, opts) end,
        highlights           = function (groups, colors, opts) end,
    },
    init = function()
        vim.cmd.colorscheme("tairiki")
    end,
}
