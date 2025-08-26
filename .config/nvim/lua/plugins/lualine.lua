return {
    "nvim-lualine/lualine.nvim",
    enabled      = false,
    dependencies = {
        "linrongbin16/lsp-progress.nvim"
    },
    opts         = function ()
        local lsp_progress = require("utils.lualine.components.lsp-progress")

        return {
            options           = {
                theme                = "auto",
                icons_enabled        = true,
                component_separators = { left = "|", right = "|" },
                section_separators   = { left = "", right = "" },
                disabled_filetypes   = {
                    statusline = {},
                    winbar     = {},
                },
                ignore_focus         = {},
                always_divide_middle = true,
                always_show_tabline  = false,
                globalstatus         = true,
            },
            sections          = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { lsp_progress, "diagnostics" },
                lualine_y = {
                    { "filetype",   icons_enabled = false },
                    "encoding",
                    { "fileformat", icons_enabled = false }
                },
                lualine_z = { "location" }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline           = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            winbar            = {},
            inactive_winbar   = {},
            extensions        = {}
        }
    end
}
