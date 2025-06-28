return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "linrongbin16/lsp-progress.nvim"
    },
    opts = function ()
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
                    {
                        "tabs",
                        max_length           = vim.o.columns,
                        mode                 = 1,
                        path                 = 0,
                        use_mode_colors      = true,
                        tabs_color           = {
                            active   = "lualine_a_normal",
                            inactive = "lualine_c_normal",
                        },
                        show_modified_status = false,
                    },
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
        }
    end
}
