return {
    "nvim-lualine/lualine.nvim",
    config = function ()
        local lualine      = require("lualine")
        local iceberg      = require("nvim.lib.lualine.themes.icerberg")
        local lsp_progress = require("nvim.lib.lualine.components.lsp_progress")

        -- Setup
        lualine.setup({
            options           = {
                theme                = iceberg,
                icons_enabled        = true,
                component_separators = { left = "|", right = "|" },
                section_separators   = { left = "", right = "" },
                disabled_filetypes   = {
                    statusline = {},
                    winbar     = {},
                },
                ignore_focus         = {},
                always_divide_middle = true,
                globalstatus         = true,
                refresh              = {
                    statusline = 100,
                    tabline    = 100,
                    winbar     = 100,
                }
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
                lualine_a = {
                    { "tabs", mode = 1, show_modified_status = false },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            winbar            = {},
            inactive_winbar   = {},
            extensions        = {}
        })
    end
}
