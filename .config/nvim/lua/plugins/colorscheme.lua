return {
    {
        "marko-cerovac/material.nvim",
        lazy     = false,
        priority = 1000,
        opts     = {
            contrast          = {
                terminal            = true,
                sidebars            = true,
                floating_windows    = true,
                cursor_line         = false,
                lsp_virtual_text    = true,
                non_current_windows = false,
                filetypes           = {},
            },
            styles            = {
                comments  = { italic = true },
                strings   = {},
                keywords  = {},
                functions = { italic = true },
                variables = {},
                operators = {},
                types     = { bold = true },
            },
            plugins           = {
                "blink",
                "dap",
                "neotest",
                "nvim-cmp",
                "nvim-web-devicons",
            },
            disable           = {
                colored_cursor = false,
                borders        = false,
                background     = false,
                term_colors    = false,
                eob_lines      = false
            },
            high_visibility   = {
                lighter = false,
                darker  = false
            },
            lualine_style     = "default",
            async_loading     = true,
            custom_colors     = function (colors)
                colors.editor.border   = "#393c4b"
                colors.syntax.comments = "#6b6f7d"
            end,
            custom_highlights = {},
        },
        init     = function ()
            vim.g.material_style = "deep ocean"
            vim.cmd.colorscheme("material")
            vim.opt.guicursor = ""
        end
    },
}
